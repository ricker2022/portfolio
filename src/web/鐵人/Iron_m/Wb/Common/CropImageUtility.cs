using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;

namespace Wb.Common
{
    public class CropImageUtility
    {
        //圖片來源
        protected string org_file_path
        {
            set;
            get;
        }

        //存檔路徑
        protected string save_file_path
        {
            set;
            get;
        }

        //舊檔案
        protected string old_file_path
        {
            set;
            get;
        }

        //org_file_path圖片來源
        //save_file_path存檔路徑
        public CropImageUtility(string org_file_path, string save_file_path,string old_file_path = "")
        {
            this.org_file_path = org_file_path;
            this.save_file_path = save_file_path;            
            this.old_file_path = old_file_path;            
        }

        public void ImageCrop( int? x1 = null , int? y1 = null , int? x2 = null , int? y2 = null , int? max_width = null , int? max_height = null )
        {
            if(
                    ( x1.HasValue )
                &&  ( y1.HasValue )
                &&  ( x2.HasValue )
                &&  ( y2.HasValue )
              )
            {
                //取得裁剪的區域座標
                int section_x1 = Convert.ToInt32( x1 );
                int section_x2 = Convert.ToInt32( x2 );
                int section_y1 = Convert.ToInt32( y1 );
                int section_y2 = Convert.ToInt32( y2 );

                //取得裁剪的圖片寬高
                int width = section_x2 - section_x1;
                int height = section_y2 - section_y1;

                //讀取原圖片
                if (System.IO.File.Exists(this.org_file_path))
                {
                    Image sourceImage = Image.FromFile(this.org_file_path);
                
                    //先複製一份到目的地
                    //System.IO.File.Copy( this.org_file_path , this.save_file_path , true ); 
            
                    //從原檔案取得裁剪圖片(如有選取範圍)
                    Image cropImage = sourceImage;
                    if (
                            (section_x1 >= 0)
                        && (section_y1 >= 0)
                        && (width > 0)
                        && (height > 0)
                      )
                    {
                        cropImage = this.Crop(sourceImage, new Rectangle(section_x1, section_y1, width, height));
                    }

                    //將採剪下來的圖片做縮圖處理(如有設定最大寬高)
                    Image resizeImage = cropImage;
                    if (
                        (max_width.HasValue && max_height.HasValue)
                     && (
                            cropImage.Width > max_width
                         || cropImage.Height > max_height
                        )
                    )
                    {
                        resizeImage = this.Resize(cropImage, new Size(Convert.ToInt32(max_width), Convert.ToInt32(max_height)));
                    }

                
                    //將縮圖儲存
                    //System.IO.FileInfo fi = new System.IO.FileInfo( this.save_file_path );  //取得目的檔資訊
                    //string fileName = fi.Name;                                              //取得目的檔的檔名
                    //string savePath = string.Format(@"{0}\{1}", fi.DirectoryName, fileName);
                    Save(resizeImage);

                    resizeImage.Dispose();
                    cropImage.Dispose();
                    sourceImage.Dispose();

                    Delete();
                }
                else
                {
                    return;
                }
            }
            else
            {
                //讀取原圖片
                if (System.IO.File.Exists(this.org_file_path))
                {
                    if (this.org_file_path != this.save_file_path)
                    {
                        Image sourceImage = Image.FromFile(this.org_file_path);

                        Image resizeImage = sourceImage;

                        if (
                            (max_width.HasValue && max_height.HasValue)
                         && (
                                sourceImage.Width > max_width
                             || sourceImage.Height > max_height
                            )
                        )
                        {
                            resizeImage = this.Resize(sourceImage, new Size(Convert.ToInt32(max_width), Convert.ToInt32(max_height)));
                        }

                        Save(resizeImage);

                        sourceImage.Dispose();

                        Delete();
                    }
                }
                else
                {
                    return;
                }
            }
        }

        private Image Crop(Image img, Rectangle cropArea) 
        { 
            Bitmap bmpImage = new Bitmap(img); 
            Bitmap bmpCrop = bmpImage.Clone(cropArea, bmpImage.PixelFormat);
            return (Image)bmpCrop; 
        }

        private Image Resize(Image imgToResize, Size size) 
        { 
            int sourceWidth = imgToResize.Width; 
            int sourceHeight = imgToResize.Height; 
            float nPercent = 0; 
            float nPercentW = 0; 
            float nPercentH = 0; 

            nPercentW = ((float)size.Width / (float)sourceWidth); 
            nPercentH = ((float)size.Height / (float)sourceHeight); 
            if (nPercentH < nPercentW) 
            { 
                nPercent = nPercentH; 
            } 
            else 
            { 
                nPercent = nPercentW; 
            } 
            
            int destWidth = (int)(sourceWidth * nPercent); 
            int destHeight = (int)(sourceHeight * nPercent);
            destWidth = destWidth == 0 ? 1 : destWidth;
            destHeight = destHeight == 0 ? 1 : destHeight;
            Bitmap bmp = new Bitmap(destWidth, destHeight); 
            Graphics g = Graphics.FromImage((System.Drawing.Image)bmp); 
            g.InterpolationMode = InterpolationMode.HighQualityBicubic; 
            g.DrawImage(imgToResize, 0, 0, destWidth, destHeight); 
            g.Dispose(); 
            return (Image)bmp; 
        }

        private void Save( Image img)
        {    
            // Encoder parameter for image quality    
            //EncoderParameter qualityParam = new EncoderParameter(Encoder.Quality, quality);     
            
            // Jpeg image codec    
            //System.IO.FileInfo fi = new System.IO.FileInfo( this.save_file_path );  //取得目的檔資訊
            //string fileName = fi.Name;                                              //取得目的檔檔名
            //String savePath = string.Format(@"{0}\{1}", fi.DirectoryName, fileName);

            img.Save(this.save_file_path);
            
            



            /*
            ImageCodecInfo Codec = this.getEncoderInfo("image/jpeg");
            
            if (Codec == null)    
            {        
                return null;    
            }     
            
            EncoderParameters encoderParams = new EncoderParameters(1);    
            encoderParams.Param[0] = qualityParam;
            img.Save(this.save_file_path, Codec, encoderParams); 
            img.Dispose();
            */
            //return fileName;
        }

        public void Delete()
        {
            //如有舊檔案，將檔案刪除
            if (this.old_file_path != "" && this.old_file_path != this.save_file_path && System.IO.File.Exists(this.old_file_path))
            {
                System.IO.File.Delete(this.old_file_path);
            }
        }

        private ImageCodecInfo getEncoderInfo(string mimeType)
        {    
            // Get image codecs for all image formats    
            
            ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();     
            
            
            // Find the correct image codec
            for (int i = 0; i < codecs.Length; i++)
            {        
                if (codecs[i].MimeType == mimeType)        
                {            
                    return codecs[i];        
                }    
            }    
            
            return null;
        }
    }
}