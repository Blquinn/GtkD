/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage


module gtk.Image;

private import gdk.PaintableIF;
private import gdkpixbuf.Pixbuf;
private import gio.IconIF;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * The #GtkImage widget displays an image. Various kinds of object
 * can be displayed as an image; most typically, you would load a
 * #GdkTexture from a file, and then display that.
 * There’s a convenience function to do this, gtk_image_new_from_file(),
 * used as follows:
 * |[<!-- language="C" -->
 * GtkWidget *image;
 * image = gtk_image_new_from_file ("myfile.png");
 * ]|
 * If the file isn’t loaded successfully, the image will contain a
 * “broken image” icon similar to that used in many web browsers.
 * If you want to handle errors in loading the file yourself,
 * for example by displaying an error message, then load the image with
 * gdk_texture_new_from_file(), then create the #GtkImage with
 * gtk_image_new_from_paintable().
 * 
 * Sometimes an application will want to avoid depending on external data
 * files, such as image files. See the documentation of #GResource for details.
 * In this case, the #GtkImage:resource, gtk_image_new_from_resource() and
 * gtk_image_set_from_resource() should be used.
 * 
 * # CSS nodes
 * 
 * GtkImage has a single CSS node with the name image. The style classes
 * .normal-icons or .large-icons may appear, depending on the #GtkImage:icon-size
 * property.
 * 
 * # Accessibility
 * 
 * GtkImage uses the #GTK_ACCESSIBLE_ROLE_IMG role.
 */
public class Image : Widget
{
	/** the main Gtk struct */
	protected GtkImage* gtkImage;

	/** Get the main Gtk struct */
	public GtkImage* getImageStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkImage;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkImage;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkImage* gtkImage, bool ownedRef = false)
	{
		this.gtkImage = gtkImage;
		super(cast(GtkWidget*)gtkImage, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_image_get_type();
	}

	/**
	 * Creates a new empty #GtkImage widget.
	 *
	 * Returns: a newly created #GtkImage widget.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_image_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkImage*) __p);
	}

	/**
	 * Creates a new #GtkImage displaying the file @filename. If the file
	 * isn’t found or can’t be loaded, the resulting #GtkImage will
	 * display a “broken image” icon. This function never returns %NULL,
	 * it always returns a valid #GtkImage widget.
	 *
	 * If you need to detect failures to load the file, use
	 * gdk_texture_new_from_file() to load the file yourself, then create
	 * the #GtkImage from the texture.
	 *
	 * The storage type (gtk_image_get_storage_type()) of the returned
	 * image is not defined, it will be whatever is appropriate for
	 * displaying the file.
	 *
	 * Params:
	 *     filename = a filename
	 *
	 * Returns: a new #GtkImage
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string filename)
	{
		auto __p = gtk_image_new_from_file(Str.toStringz(filename));

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_from_file");
		}

		this(cast(GtkImage*) __p);
	}

	/**
	 * Creates a #GtkImage displaying an icon from the current icon theme.
	 * If the icon name isn’t known, a “broken image” icon will be
	 * displayed instead.  If the current icon theme is changed, the icon
	 * will be updated appropriately.
	 *
	 * Note: Before 3.94, this function was taking an extra icon size
	 * argument. See gtk_image_set_icon_size() for another way to set
	 * the icon size.
	 *
	 * Params:
	 *     icon = an icon
	 *
	 * Returns: a new #GtkImage displaying the themed icon
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(IconIF icon)
	{
		auto __p = gtk_image_new_from_gicon((icon is null) ? null : icon.getIconStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_from_gicon");
		}

		this(cast(GtkImage*) __p);
	}

	/**
	 * Creates a new #GtkImage displaying @paintable.
	 * The #GtkImage does not assume a reference to the
	 * paintable; you still need to unref it if you own references.
	 * #GtkImage will add its own reference rather than adopting yours.
	 *
	 * The #GtkImage will track changes to the @paintable and update
	 * its size and contents in response to it.
	 *
	 * Params:
	 *     paintable = a #GdkPaintable, or %NULL
	 *
	 * Returns: a new #GtkImage
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(PaintableIF paintable)
	{
		auto __p = gtk_image_new_from_paintable((paintable is null) ? null : paintable.getPaintableStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_from_paintable");
		}

		this(cast(GtkImage*) __p);
	}

	/**
	 * Creates a new #GtkImage displaying @pixbuf.
	 * The #GtkImage does not assume a reference to the
	 * pixbuf; you still need to unref it if you own references.
	 * #GtkImage will add its own reference rather than adopting yours.
	 *
	 * This is a helper for gtk_image_new_from_paintable(), and you can't
	 * get back the exact pixbuf once this is called, only a texture.
	 *
	 * Note that this function just creates an #GtkImage from the pixbuf. The
	 * #GtkImage created will not react to state changes. Should you want that,
	 * you should use gtk_image_new_from_icon_name().
	 *
	 * Params:
	 *     pixbuf = a #GdkPixbuf, or %NULL
	 *
	 * Returns: a new #GtkImage
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Pixbuf pixbuf)
	{
		auto __p = gtk_image_new_from_pixbuf((pixbuf is null) ? null : pixbuf.getPixbufStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_from_pixbuf");
		}

		this(cast(GtkImage*) __p);
	}

	/**
	 * Resets the image to be empty.
	 */
	public void clear()
	{
		gtk_image_clear(gtkImage);
	}

	/**
	 * Gets the #GIcon and size being displayed by the #GtkImage.
	 * The storage type of the image must be %GTK_IMAGE_EMPTY or
	 * %GTK_IMAGE_GICON (see gtk_image_get_storage_type()).
	 * The caller of this function does not own a reference to the
	 * returned #GIcon.
	 *
	 * Note: This function was changed in 3.94 not to use out parameters
	 * anymore, but return the GIcon directly. See gtk_image_get_icon_size()
	 * for a way to get the icon size.
	 *
	 * Returns: a #GIcon, or %NULL
	 */
	public IconIF getGicon()
	{
		auto __p = gtk_image_get_gicon(gtkImage);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(IconIF)(cast(GIcon*) __p);
	}

	/**
	 * Gets the icon name and size being displayed by the #GtkImage.
	 * The storage type of the image must be %GTK_IMAGE_EMPTY or
	 * %GTK_IMAGE_ICON_NAME (see gtk_image_get_storage_type()).
	 * The returned string is owned by the #GtkImage and should not
	 * be freed.
	 *
	 * Note: This function was changed in 3.94 not to use out parameters
	 * anymore, but return the icon name directly. See gtk_image_get_icon_size()
	 * for a way to get the icon size.
	 *
	 * Returns: the icon name, or %NULL
	 */
	public string getIconName()
	{
		return Str.toString(gtk_image_get_icon_name(gtkImage));
	}

	/**
	 * Gets the icon size used by the @image when rendering icons.
	 *
	 * Returns: the image size used by icons
	 */
	public GtkIconSize getIconSize()
	{
		return gtk_image_get_icon_size(gtkImage);
	}

	/**
	 * Gets the image #GdkPaintable being displayed by the #GtkImage.
	 * The storage type of the image must be %GTK_IMAGE_EMPTY or
	 * %GTK_IMAGE_PAINTABLE (see gtk_image_get_storage_type()).
	 * The caller of this function does not own a reference to the
	 * returned paintable.
	 *
	 * Returns: the displayed paintable, or %NULL if
	 *     the image is empty
	 */
	public PaintableIF getPaintable()
	{
		auto __p = gtk_image_get_paintable(gtkImage);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PaintableIF)(cast(GdkPaintable*) __p);
	}

	/**
	 * Gets the pixel size used for named icons.
	 *
	 * Returns: the pixel size used for named icons.
	 */
	public int getPixelSize()
	{
		return gtk_image_get_pixel_size(gtkImage);
	}

	/**
	 * Gets the type of representation being used by the #GtkImage
	 * to store image data. If the #GtkImage has no image data,
	 * the return value will be %GTK_IMAGE_EMPTY.
	 *
	 * Returns: image representation being used
	 */
	public GtkImageType getStorageType()
	{
		return gtk_image_get_storage_type(gtkImage);
	}

	/**
	 * See gtk_image_new_from_file() for details.
	 *
	 * Params:
	 *     filename = a filename or %NULL
	 */
	public void setFromFile(string filename)
	{
		gtk_image_set_from_file(gtkImage, Str.toStringz(filename));
	}

	/**
	 * See gtk_image_new_from_gicon() for details.
	 *
	 * Note: Before 3.94, this function was taking an extra icon size
	 * argument. See gtk_image_set_icon_size() for another way to set
	 * the icon size.
	 *
	 * Params:
	 *     icon = an icon
	 */
	public void setFromGicon(IconIF icon)
	{
		gtk_image_set_from_gicon(gtkImage, (icon is null) ? null : icon.getIconStruct());
	}

	/**
	 * See gtk_image_new_from_icon_name() for details.
	 *
	 * Note: Before 3.94, this function was taking an extra icon size
	 * argument. See gtk_image_set_icon_size() for another way to set
	 * the icon size.
	 *
	 * Params:
	 *     iconName = an icon name or %NULL
	 */
	public void setFromIconName(string iconName)
	{
		gtk_image_set_from_icon_name(gtkImage, Str.toStringz(iconName));
	}

	/**
	 * See gtk_image_new_from_paintable() for details.
	 *
	 * Params:
	 *     paintable = a #GdkPaintable or %NULL
	 */
	public void setFromPaintable(PaintableIF paintable)
	{
		gtk_image_set_from_paintable(gtkImage, (paintable is null) ? null : paintable.getPaintableStruct());
	}

	/**
	 * See gtk_image_new_from_pixbuf() for details.
	 *
	 * Note: This is a helper for gtk_image_set_from_paintable(), and you can't
	 * get back the exact pixbuf once this is called, only a paintable.
	 *
	 * Params:
	 *     pixbuf = a #GdkPixbuf or %NULL
	 */
	public void setFromPixbuf(Pixbuf pixbuf)
	{
		gtk_image_set_from_pixbuf(gtkImage, (pixbuf is null) ? null : pixbuf.getPixbufStruct());
	}

	/**
	 * See gtk_image_new_from_resource() for details.
	 *
	 * Params:
	 *     resourcePath = a resource path or %NULL
	 */
	public void setFromResource(string resourcePath)
	{
		gtk_image_set_from_resource(gtkImage, Str.toStringz(resourcePath));
	}

	/**
	 * Suggests an icon size to the theme for named icons.
	 *
	 * Params:
	 *     iconSize = the new icon size
	 */
	public void setIconSize(GtkIconSize iconSize)
	{
		gtk_image_set_icon_size(gtkImage, iconSize);
	}

	/**
	 * Sets the pixel size to use for named icons. If the pixel size is set
	 * to a value != -1, it is used instead of the icon size set by
	 * gtk_image_set_from_icon_name().
	 *
	 * Params:
	 *     pixelSize = the new pixel size
	 */
	public void setPixelSize(int pixelSize)
	{
		gtk_image_set_pixel_size(gtkImage, pixelSize);
	}
}
