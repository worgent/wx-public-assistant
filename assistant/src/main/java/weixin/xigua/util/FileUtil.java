package weixin.xigua.util;

import weixin.base.file.fileUtil;
import weixin.xigua.constants.XiguaConstant;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

/**
 * Created by worgen on 2016/3/3.
 */
public class FileUtil {
    public static int downloadPicture(String url, String fileName) {
        if (url.indexOf("webp") != -1) {
            try {
                fileUtil.downLoadFromUrl(url,
                        "baidu.webp", XiguaConstant.articleThumbnailPath);
                File file1 = new File(XiguaConstant.articleThumbnailPath+"baidu.webp");
                File file2 = new File(XiguaConstant.articleThumbnailPath+fileName);

//        System.out.println(System.getProperty("java.library.path"));

                try {

                    BufferedImage im = ImageIO.read(file1);
                    ImageIO.write(im, "png", file2);


                } catch (IOException e) {
                    e.printStackTrace();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                fileUtil.downLoadFromUrl(url,
                        fileName, XiguaConstant.articleThumbnailPath);
            } catch (IOException e) {
                e.printStackTrace();
                return -1;
            }
        }
        return 0;
    }
}
