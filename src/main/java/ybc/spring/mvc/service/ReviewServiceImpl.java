package ybc.spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.multipart.MultipartFile;
import ybc.spring.mvc.dao.ReviewDAO;
import ybc.spring.mvc.utils.ImgUploadUtil;
import ybc.spring.mvc.vo.Review;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service("rvsrv")
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewDAO rvdao;
    @Autowired
    private ImgUploadUtil imgutil;

    @Override
    public boolean newReview(Review rv, MultipartFile[] img) {
        String uuid = imgutil.makeUUID();

        // check if the file exists,
        if (imgutil.checkImgFiles(img)) {
            List<String> imgs = new ArrayList<>();
            // save img names in new arraylist

            for (MultipartFile f : img) {
                if (!f.getOriginalFilename().isEmpty())
                    imgs.add(imgutil.ImageUpload(f, uuid));
                else
                    imgs.add("-/-");
            } //for

            // to save the results on table
            String fnames = "";
            String fsizes = "";

            for (int i = 0; i < imgs.size(); ++i) {
                fnames += imgs.get(i).split("[/]")[0] + "/";
                fsizes += imgs.get(i).split("[/]")[1] + "/";
            }

            rv.setFnames(fnames);
            rv.setFsizes(fsizes);
            rv.setUuid(uuid);

        } //if

        // save img uploaded on the table
        int id = rvdao.insertReview(rv);

        return true;

//        boolean isInserted=false;
//        if(rvdao.insertReview(rv)>0) isInserted=true;
//
//        return isInserted;
    }

    @Override
    public void modifyReview(Review rv, MultipartFile[] img) {

        if (imgutil.checkImgFiles(img)) {
            List<String> imgs = new ArrayList<>();

            for (MultipartFile f : img) {
                if (!f.getOriginalFilename().isEmpty())
                    imgs.add(imgutil.ImageUpload(f, rv.getUuid()));
                else
                    imgs.add("-/-");
            }// for

            String fn = rvdao.readFnames(rv.getRvno());
            String fs = rvdao.readFsizes(rv.getRvno());

            String[] ofn = fn.split("[/]");
            String[] ofs = fs.split("[/]");

            String fnames = "";
            String fsizes = "";
            for (int i = 0; i < imgs.size(); ++i) {
                fnames += imgs.get(i).split("[/]")[0] + "/";
                fsizes += imgs.get(i).split("[/]")[1] + "/";
            }

            String[] nfn = fnames.split("[/]");
            String[] nfs = fsizes.split("[/]");

            String todie[] = new String[3];
            for (int i = 0; i < rv.getTodie().length(); ++i) {
                int pos = Integer.parseInt(rv.getTodie().substring(i, i + 1));
                ofn[pos-1] = nfn[i];  // 변경한 파일이름 저장
                ofs[pos-1] = nfs[i];
                todie[i] = fn.split("[/]")[pos - 1];
            }

            // 수정된 결과 확인
            // System.out.println(String.join("/", ofn));
            fnames = String.join("/", ofn);
            fsizes = String.join("/", ofs);

            rv.setFnames(fnames);
            rv.setFsizes(fsizes);

            String fpath = "/usr/local/var/www/cdn2/";
            for (int i = 0; i < todie.length; ++i) {
                try {
                    // 파일이름 재조합을 위해 분해
                    int pos = todie[i].lastIndexOf(".");
                    String name = todie[i].substring(0, pos);
                    String ext = todie[i].substring(pos + 1);
                    // 이미지 경로 생성
                    String one = name + rv.getUuid() + "." + ext;

                    File f = new File(fpath + one);
                    f.delete();
                } catch (Exception e) {
                }
            }
        } //if

        rvdao.updateReview(rv);
    }

    @Override
    public List<Review> readReview(String cp) {
        int snum = (Integer.parseInt(cp)-1)*30;

        return rvdao.selectReview(snum);
    }

    @Override
    public List<Review> readReview(String cp, String ftype, String fkey) {
        int snum = (Integer.parseInt(cp) - 1) * 30;

        Map<String, Object> params = new HashMap<>();
        params.put("snum", snum);
        params.put("ftype", ftype);
        params.put("fkey", fkey);

        return rvdao.findSelectReview(params);
    }

    @Override
    public List<Review> readReview(String cp, String floc, String ftype, String fkey) {
        int snum = (Integer.parseInt(cp) - 1) * 30;

        Map<String, Object> params = new HashMap<>();
        params.put("snum", snum);
        params.put("floc", floc);
        params.put("ftype", ftype);
        params.put("fkey", fkey);

        return rvdao.findSelectFReview(params);
    } //loc filter

    @Override
    public Review readOneReview(String rvno) {
        return rvdao.selectOneReview(rvno);
    }

    @Override
    public String readPrvrvno(String rvno) {
        System.out.println(rvno);
        return rvdao.selectPrvrvno(rvno);
    } //previous post

    @Override
    public String readNxtrvno(String rvno) {
        return rvdao.selectNxtrvno(rvno);
    } //next post

    @Override
    public int countReview() {
        return rvdao.selectCountReview();
    } //numbers of posts(rvno)

    @Override
    public int countReview(String loc, String ftype, String fkey) {
        return rvdao.selectCountFReview();
    }

    @Override
    public int countReview(String ftype, String fkey) {
        Map<String, Object> params = new HashMap<>();
        params.put("ftype", ftype);
        params.put("fkey", fkey);

        return rvdao.selectCountReview(params);
    }

    @Override
    public boolean viewCountReview(String rvno) {
        boolean isUpdated=false;
        if (rvdao.viewCountReview(rvno) > 0) isUpdated=true;
        return isUpdated;
    } // views

    @Override
    public void modifyLikes(String rvno) { rvdao.updatelikes(rvno); }

    @Override
    public void modifyNlikes(String rvno) {
        rvdao.updateNlikes(rvno);
    }

    @Override
    public Review removerv(String rvno) {
        Review rv = rvdao.selectOneReview(rvno);
        rvdao.deleteReview(rvno);
        imgutil.delImg(rv);
        return rv;
    }
}
