/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
 
// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage

/*
 * Conversion parameters:
 * inFile  = gdk-Input-Devices.html
 * outPack = gdk
 * outFile = Device
 * strct   = GdkDevice
 * realStrct=
 * ctorStrct=
 * clss    = Device
 * interf  = 
 * class Code: No
 * interface Code: No
 * template for:
 * extend  = 
 * implements:
 * prefixes:
 * 	- gdk_device_
 * omit structs:
 * omit prefixes:
 * omit code:
 * imports:
 * 	- glib.ListG
 * 	- gdk.Device
 * 	- gdk.Window
 * structWrap:
 * 	- GList* -> ListG
 * 	- GdkDevice* -> Device
 * 	- GdkWindow* -> Window
 * module aliases:
 * local aliases:
 */

module gdk.Device;

private import gtkc.gdktypes;

private import gtkc.gdk;

private import glib.ListG;
private import gdk.Device;
private import gdk.Window;



/**
 * Description
 * In addition to the normal keyboard and mouse input devices, GTK+ also
 * contains support for extended input devices. In
 * particular, this support is targeted at graphics tablets. Graphics
 * tablets typically return sub-pixel positioning information and possibly
 * information about the pressure and tilt of the stylus. Under
 * X, the support for extended devices is done through the
 * XInput extension.
 * Because handling extended input devices may involve considerable
 * overhead, they need to be turned on for each GdkWindow
 * individually using gdk_input_set_extension_events().
 * (Or, more typically, for GtkWidgets, using gtk_widget_set_extension_events()).
 * As an additional complication, depending on the support from
 * the windowing system, its possible that a normal mouse
 * cursor will not be displayed for a particular extension
 * device. If an application does not want to deal with displaying
 * a cursor itself, it can ask only to get extension events
 * from devices that will display a cursor, by passing the
 * GDK_EXTENSION_EVENTS_CURSOR value to
 * gdk_input_set_extension_events(). Otherwise, the application
 * must retrieve the device information using gdk_devices_list(),
 * check the has_cursor field, and,
 * if it is FALSE, draw a cursor itself when it receives
 * motion events.
 * Each pointing device is assigned a unique integer ID; events from a
 * particular device can be identified by the
 * deviceid field in the event structure. The
 * events generated by pointer devices have also been extended to contain
 * pressure, xtilt
 * and ytilt fields which contain the extended
 * information reported as additional valuators
 * from the device. The pressure field is a
 * a double value ranging from 0.0 to 1.0, while the tilt fields are
 * double values ranging from -1.0 to 1.0. (With -1.0 representing the
 * maximum tilt to the left or up, and 1.0 representing the maximum
 * tilt to the right or down.)
 * One additional field in each event is the
 * source field, which contains an
 * enumeration value describing the type of device; this currently
 * can be one of GDK_SOURCE_MOUSE, GDK_SOURCE_PEN, GDK_SOURCE_ERASER,
 * or GDK_SOURCE_CURSOR. This field is present to allow simple
 * applications to (for instance) delete when they detect eraser
 * devices without having to keep track of complicated per-device
 * settings.
 * Various aspects of each device may be configured. The easiest way of
 * creating a GUI to allow the user to configure such a device
 * is to use the GtkInputDialog widget in GTK+.
 * However, even when using this widget, application writers
 * will need to directly query and set the configuration parameters
 * in order to save the state between invocations of the application.
 * The configuration of devices is queried using gdk_devices_list().
 * Each device must be activated using gdk_device_set_mode(), which
 * also controls whether the device's range is mapped to the
 * entire screen or to a single window. The mapping of the valuators of
 * the device onto the predefined valuator types is set using
 * gdk_device_set_axis_use(). And the source type for each device
 * can be set with gdk_device_set_source().
 * Devices may also have associated keys
 * or macro buttons. Such keys can be globally set to map
 * into normal X keyboard events. The mapping is set using
 * gdk_device_set_key().
 * The interfaces in this section will most likely be considerably
 * modified in the future to accomodate devices that may have different
 * sets of additional valuators than the pressure xtilt
 * and ytilt.
 */
public class Device
{
	
	/** the main Gtk struct */
	protected GdkDevice* gdkDevice;
	
	
	public GdkDevice* getDeviceStruct()
	{
		return gdkDevice;
	}
	
	
	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gdkDevice;
	}
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GdkDevice* gdkDevice)
	{
		this.gdkDevice = gdkDevice;
	}
	
	/**
	 */
	
	
	
	
	
	
	
	/**
	 * Returns the list of available input devices for the default display.
	 * The list is statically allocated and should not be freed.
	 * Returns:
	 *  a list of GdkDevice
	 */
	public static ListG gdkDevicesList()
	{
		// GList* gdk_devices_list (void);
		return new ListG( gdk_devices_list() );
	}
	
	/**
	 * Sets the source type for an input device.
	 * device:
	 * a GdkDevice.
	 * source:
	 * the source type.
	 */
	public void setSource(GdkInputSource source)
	{
		// void gdk_device_set_source (GdkDevice *device,  GdkInputSource source);
		gdk_device_set_source(gdkDevice, source);
	}
	
	/**
	 * Sets a the mode of an input device. The mode controls if the
	 * device is active and whether the device's range is mapped to the
	 * entire screen or to a single window.
	 * device:
	 * a GdkDevice.
	 * mode:
	 * the input mode.
	 * Returns:
	 * TRUE if the mode was successfully changed.
	 */
	public int setMode(GdkInputMode mode)
	{
		// gboolean gdk_device_set_mode (GdkDevice *device,  GdkInputMode mode);
		return gdk_device_set_mode(gdkDevice, mode);
	}
	
	/**
	 * Specifies the X key event to generate when a macro button of a device
	 * is pressed.
	 * device:
	 * a GdkDevice.
	 * index_:
	 * the index of the macro button to set.
	 * keyval:
	 * the keyval to generate.
	 * modifiers:
	 * the modifiers to set.
	 */
	public void setKey(uint index, uint keyval, GdkModifierType modifiers)
	{
		// void gdk_device_set_key (GdkDevice *device,  guint index_,  guint keyval,  GdkModifierType modifiers);
		gdk_device_set_key(gdkDevice, index, keyval, modifiers);
	}
	
	/**
	 * Specifies how an axis of a device is used.
	 * device:
	 * a GdkDevice.
	 * index_:
	 * the index of the axis.
	 * use:
	 * specifies how the axis is used.
	 */
	public void setAxisUse(uint index, GdkAxisUse use)
	{
		// void gdk_device_set_axis_use (GdkDevice *device,  guint index_,  GdkAxisUse use);
		gdk_device_set_axis_use(gdkDevice, index, use);
	}
	
	/**
	 * Returns the core pointer device for the default display.
	 * Returns:
	 *  the core pointer device; this is owned by the
	 *  display and should not be freed.
	 */
	public static Device getCorePointer()
	{
		// GdkDevice* gdk_device_get_core_pointer (void);
		return new Device( gdk_device_get_core_pointer() );
	}
	
	/**
	 * Gets the current state of a device.
	 * device:
	 * a GdkDevice.
	 * window:
	 * a GdkWindow.
	 * axes:
	 * an array of doubles to store the values of the axes of device in,
	 *  or NULL.
	 * mask:
	 * location to store the modifiers, or NULL.
	 */
	public void getState(Window window, double* axes, GdkModifierType* mask)
	{
		// void gdk_device_get_state (GdkDevice *device,  GdkWindow *window,  gdouble *axes,  GdkModifierType *mask);
		gdk_device_get_state(gdkDevice, (window is null) ? null : window.getWindowStruct(), axes, mask);
	}
	
	/**
	 * Obtains the motion history for a device; given a starting and
	 * ending timestamp, return all events in the motion history for
	 * the device in the given range of time. Some windowing systems
	 * do not support motion history, in which case, FALSE will
	 * be returned. (This is not distinguishable from the case where
	 * motion history is supported and no events were found.)
	 * device:
	 *  a GdkDevice
	 * window:
	 *  the window with respect to which which the event coordinates will be reported
	 * start:
	 *  starting timestamp for range of events to return
	 * stop:
	 *  ending timestamp for the range of events to return
	 * events:
	 *  location to store a newly-allocated array of GdkTimeCoord, or NULL
	 * n_events:
	 *  location to store the length of events, or NULL
	 * Returns:
	 *  TRUE if the windowing system supports motion history and
	 *  at least one event was found.
	 */
	public int getHistory(Window window, uint start, uint stop, GdkTimeCoord*** events, int* nEvents)
	{
		// gboolean gdk_device_get_history (GdkDevice *device,  GdkWindow *window,  guint32 start,  guint32 stop,  GdkTimeCoord ***events,  gint *n_events);
		return gdk_device_get_history(gdkDevice, (window is null) ? null : window.getWindowStruct(), start, stop, events, nEvents);
	}
	
	/**
	 * Frees an array of GdkTimeCoord that was returned by gdk_device_get_history().
	 * events:
	 * an array of GdkTimeCoord.
	 * n_events:
	 * the length of the array.
	 */
	public static void freeHistory(GdkTimeCoord** events, int nEvents)
	{
		// void gdk_device_free_history (GdkTimeCoord **events,  gint n_events);
		gdk_device_free_history(events, nEvents);
	}
	
	
	/**
	 * Interprets an array of double as axis values for a given device,
	 * and locates the value in the array for a given axis use.
	 * device:
	 *  a GdkDevice
	 * axes:
	 *  pointer to an array of axes
	 * use:
	 *  the use to look for
	 * value:
	 *  location to store the found value.
	 * Returns:
	 *  TRUE if the given axis use was found, otherwise FALSE
	 */
	public int getAxis(double* axes, GdkAxisUse use, double* value)
	{
		// gboolean gdk_device_get_axis (GdkDevice *device,  gdouble *axes,  GdkAxisUse use,  gdouble *value);
		return gdk_device_get_axis(gdkDevice, axes, use, value);
	}
	
	/**
	 * Turns extension events on or off for a particular window,
	 * and specifies the event mask for extension events.
	 * window:
	 * a GdkWindow.
	 * mask:
	 * the event mask
	 * mode:
	 * the type of extension events that are desired.
	 */
	public static void gdkInputSetExtensionEvents(Window window, int mask, GdkExtensionMode mode)
	{
		// void gdk_input_set_extension_events (GdkWindow *window,  gint mask,  GdkExtensionMode mode);
		gdk_input_set_extension_events((window is null) ? null : window.getWindowStruct(), mask, mode);
	}
	
}
