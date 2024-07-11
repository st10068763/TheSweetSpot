using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web;

namespace TheSweetSpot
{
    public class ImageManipulationClass
    {
        public ImageManipulationClass()
        {
        }

        public byte[] PhotoProcess(Image image)
        {
            using (MemoryStream ms = new MemoryStream())
            {
                image.Save(ms, ImageFormat.Jpeg); // You can use other formats if needed
                return ms.ToArray();
            }
        }

        public Image PhotoBuilder(byte[] imageData)
        {
            using (MemoryStream ms = new MemoryStream(imageData))
            {
                return Image.FromStream(ms);
            }
        }

        public static byte[] ConvertImageToByteArray(string imagePath)
        {
            using (Image image = Image.FromFile(imagePath))
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    image.Save(ms, image.RawFormat);
                    return ms.ToArray();
                }
            }
        }

        public string SaveUploadedFile(HttpPostedFile file)
        {
            if (file != null && file.ContentLength > 0)
            {
                try
                {
                    string fileName = Path.GetFileName(file.FileName);
                    string filePath = "~/CakeImages/" + fileName;
                    string serverPath = HttpContext.Current.Server.MapPath(filePath);

                    file.SaveAs(serverPath);
                    return filePath;
                }
                catch (Exception ex)
                {
                    throw new ApplicationException("Error saving file", ex);
                }
            }
            return null;
        }
    }
}
