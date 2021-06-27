package ybc.spring.mvc.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import ybc.spring.mvc.vo.Review;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component("imgutil")
public class ImgUploadUtil {

    // img path
    private String uploadPath = "/usr/local/var/www/cdn2/";

    // to know if img file exists
    public boolean checkImgFiles(MultipartFile[] img) {
        boolean isFiles = false;

        for(MultipartFile f: img) {
            if(!f.getOriginalFilename().isEmpty()) {
                isFiles = true;
                break;
            }
        }
        return isFiles;
    }

    public String ImageUpload(MultipartFile f, String uuid){
        // uuid: 20210623030203
        // fname: abc.png
        // abc20210623030203.png

        String ofname = f.getOriginalFilename();
        int pos = ofname.lastIndexOf(".");
        String nfname = ofname.substring(0, pos) +
                uuid + "." + ofname.substring(pos+1);
        // create new file name

        try {
            f.transferTo(new File(uploadPath + nfname));
        } catch (Exception e) {
            e.printStackTrace();
        } // saving img

        return ofname + "/" + (f.getSize()/1024);
        // return file name and size

    }

    // create UUID
    public String makeUUID() {
        String fmt = "yyyyMMddHHmmss";
        SimpleDateFormat sdf = new SimpleDateFormat(fmt);
        // date parsing

        return sdf.format(new Date());
    }

    // remove img
    public void delImg(Review rv) {
        String fpath = "/usr/local/var/www/cdn2/";

        //System.out.println(">>" + rv.getFnames());
        String[] todie = rv.getFnames().split("[/]");

        for (int i = 0; i < todie.length; ++i) {
            try {
                // 파일이름 재조합을 위해 분해
                int pos = todie[i].lastIndexOf(".");
                String name = todie[i].substring(0, pos);
                String ext = todie[i].substring(pos + 1);
                // 이미지 경로 생성
                String one = name + rv.getUuid() + "." + ext;
                System.out.println(fpath + one);

                File f = new File(fpath + one);
                f.delete();
            } catch (Exception e) { }
        }

    }

}

