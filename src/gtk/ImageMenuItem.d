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


module gtk.ImageMenuItem;

private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.AccelGroup;
private import gtk.MenuItem;
private import gtk.Widget;
private import gtkc.gtk;
public  import gtkc.gtktypes;


/**
 * A GtkImageMenuItem is a menu item which has an icon next to the text label.
 * 
 * Note that the user can disable display of menu icons, so make sure to still
 * fill in the text label.
 */
public class ImageMenuItem : MenuItem
{
	/** the main Gtk struct */
	protected GtkImageMenuItem* gtkImageMenuItem;

	/** Get the main Gtk struct */
	public GtkImageMenuItem* getImageMenuItemStruct()
	{
		return gtkImageMenuItem;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkImageMenuItem;
	}

	protected override void setStruct(GObject* obj)
	{
		gtkImageMenuItem = cast(GtkImageMenuItem*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkImageMenuItem* gtkImageMenuItem, bool ownedRef = false)
	{
		this.gtkImageMenuItem = gtkImageMenuItem;
		super(cast(GtkMenuItem*)gtkImageMenuItem, ownedRef);
	}

	/**
	 * Creates a new GtkImageMenuItem containing a label.
	 * If mnemonic it true the label will be created using
	 * gtk_label_new_with_mnemonic(), so underscores
	 * in label indicate the mnemonic for the menu item.
	 * Params:
	 *  label = the text of the menu item.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this (string label, bool mnemonic=true)
	{
		GtkImageMenuItem* p;
		
		if ( mnemonic )
		{
			// GtkWidget* gtk_image_menu_item_new_with_mnemonic  (const gchar *label);
			p = cast(GtkImageMenuItem*)gtk_image_menu_item_new_with_mnemonic(Str.toStringz(label));
		}
		else
		{
			// GtkWidget* gtk_image_menu_item_new_with_label  (const gchar *label);
			p = cast(GtkImageMenuItem*)gtk_image_menu_item_new_with_label(Str.toStringz(label));
		}
		
		if(p is null)
		{
			throw new ConstructionException("null returned by gtk_image_menu_item_new_with_");
		}
		
		this(p);
	}
	
	/**
	 * Creates a new GtkImageMenuItem containing the image and text from a
	 * stock item.
	 * If you want this menu item to have changeable accelerators, then pass in
	 * null for accelGroup. Next call setAccelPath() with an appropriate path
	 * for the menu item, use gtk.StockItem.StockItem.lookup() to look up the
	 * standard accelerator for the stock item, and if one is found, call
	 * gtk.AccelMap.AccelMap.addEntry() to register it.
	 * Params:
	 *   StockID    = the name of the stock item
	 *   accelGroup = the GtkAccelGroup to add the menu items accelerator to,
	 *                or NULL.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this (StockID stockID, AccelGroup accelGroup)
	{
		auto p = gtk_image_menu_item_new_from_stock(Str.toStringz(stockID), (accelGroup is null) ? null : accelGroup.getAccelGroupStruct());
		if(p is null)
		{
			throw new ConstructionException("null returned by gtk_image_menu_item_new_from_stock");
		}
		this(cast(GtkImageMenuItem*) p);
	}

	/**
	 */

	public static GType getType()
	{
		return gtk_image_menu_item_get_type();
	}

	/**
	 * Creates a new #GtkImageMenuItem with an empty label.
	 *
	 * Deprecated: Use gtk_menu_item_new() instead.
	 *
	 * Return: a new #GtkImageMenuItem
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = gtk_image_menu_item_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GtkImageMenuItem*) p);
	}

	/**
	 * Returns whether the menu item will ignore the #GtkSettings:gtk-menu-images
	 * setting and always show the image, if available.
	 *
	 * Return: %TRUE if the menu item will always show the image
	 *
	 * Since: 2.16
	 */
	public bool getAlwaysShowImage()
	{
		return gtk_image_menu_item_get_always_show_image(gtkImageMenuItem) != 0;
	}

	/**
	 * Gets the widget that is currently set as the image of @image_menu_item.
	 * See gtk_image_menu_item_set_image().
	 *
	 * Return: the widget set as image of @image_menu_item
	 */
	public Widget getImage()
	{
		auto p = gtk_image_menu_item_get_image(gtkImageMenuItem);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) p);
	}

	/**
	 * Checks whether the label set in the menuitem is used as a
	 * stock id to select the stock item for the item.
	 *
	 * Return: %TRUE if the label set in the menuitem is used as a
	 *     stock id to select the stock item for the item
	 *
	 * Since: 2.16
	 */
	public bool getUseStock()
	{
		return gtk_image_menu_item_get_use_stock(gtkImageMenuItem) != 0;
	}

	/**
	 * Specifies an @accel_group to add the menu items accelerator to
	 * (this only applies to stock items so a stock item must already
	 * be set, make sure to call gtk_image_menu_item_set_use_stock()
	 * and gtk_menu_item_set_label() with a valid stock item first).
	 *
	 * If you want this menu item to have changeable accelerators then
	 * you shouldnt need this (see gtk_image_menu_item_new_from_stock()).
	 *
	 * Params:
	 *     accelGroup = the #GtkAccelGroup
	 *
	 * Since: 2.16
	 */
	public void setAccelGroup(AccelGroup accelGroup)
	{
		gtk_image_menu_item_set_accel_group(gtkImageMenuItem, (accelGroup is null) ? null : accelGroup.getAccelGroupStruct());
	}

	/**
	 * If %TRUE, the menu item will ignore the #GtkSettings:gtk-menu-images
	 * setting and always show the image, if available.
	 *
	 * Use this property if the menuitem would be useless or hard to use
	 * without the image.
	 *
	 * Params:
	 *     alwaysShow = %TRUE if the menuitem should always show the image
	 *
	 * Since: 2.16
	 */
	public void setAlwaysShowImage(bool alwaysShow)
	{
		gtk_image_menu_item_set_always_show_image(gtkImageMenuItem, alwaysShow);
	}

	/**
	 * Sets the image of @image_menu_item to the given widget.
	 * Note that it depends on the show-menu-images setting whether
	 * the image will be displayed or not.
	 *
	 * Params:
	 *     image = a widget to set as the image for the menu item.
	 */
	public void setImage(Widget image)
	{
		gtk_image_menu_item_set_image(gtkImageMenuItem, (image is null) ? null : image.getWidgetStruct());
	}

	/**
	 * If %TRUE, the label set in the menuitem is used as a
	 * stock id to select the stock item for the item.
	 *
	 * Params:
	 *     useStock = %TRUE if the menuitem should use a stock item
	 *
	 * Since: 2.16
	 */
	public void setUseStock(bool useStock)
	{
		gtk_image_menu_item_set_use_stock(gtkImageMenuItem, useStock);
	}
}
