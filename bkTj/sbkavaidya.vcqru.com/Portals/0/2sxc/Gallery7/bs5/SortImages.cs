using System.Linq;
using ToSic.Razor.Blade;
using ToSic.Sxc.Data;

public class SortImages: Custom.Hybrid.CodeTyped
{
  /**
  * Returns the images, sorted by the passed setting
  */
  public object GetImagesSorted(ITypedItem album) {
    var images = album.Folder("Images").Files;

    switch ((string)album.Presentation.String("SortMode")) {
      case "File asc":
        images = images.OrderBy(c => c.FullName);
        break;
      case "File desc":
        images = images.OrderByDescending(c => c.FullName);
        break;
      case "Title asc":
        images = images.OrderBy(c => !c.HasMetadata)
                    .ThenBy(c => !c.HasMetadata ? "" : c.Metadata.String("Title"));
        break;
      case "Title desc":
        images = images.OrderBy(c => !c.HasMetadata)
                    .ThenByDescending(c => !c.HasMetadata ? "" : c.Metadata.String("Title"));
        break;
      case "Upload asc":
        images = images.OrderBy(c => c.Modified);
        break;
      case "Upload desc":
        images = images.OrderByDescending(c => c.Modified);
        break;
    }
    return images;
  }
}