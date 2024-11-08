using ToSic.Razor.Blade;
using ToSic.Sxc.Data;

public class Helpers: Custom.Hybrid.CodeTyped
{
  // returns required attributes for editing mode if needed
  public object EditAttr(int moduleId, ITypedItem data, ITypedStack settings) {
    if (!MyUser.IsContentAdmin) return null;

    // Must wrap in Tag.Custom so the HTML-Encoding will be correct
    return Tag.RawHtml(
      "data-module-id='" + moduleId
      + "' data-entity-id='" + data.Id
      + "' data-guid='" + data.Guid
      + "' data-iconoffset-x='" + settings.Child("HotspotMarker").String("HotspotOffsetX")
      + "' data-iconoffset-y='" + settings.Child("HotspotMarker").String("HotspotOffsetY") + "'"
    ); 
  }

  // This position the marker on the image and sets the size as needed
  public object MarkerStyles(ITypedItem hotspot, ITypedStack settings) {
    return Tag.RawHtml(
      "top: " + Kit.Convert.ForCode(hotspot.String("Y")) + "%;" 
      + " left: " + Kit.Convert.ForCode(hotspot.String("X")) + "%;" 
      + " width: " + settings.Child("HotspotMarker").String("HotspotWidth") + ";"
      + " height: " + settings.Child("HotspotMarker").String("HotspotHeight")
    );
  }
}
