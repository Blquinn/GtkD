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


module gio.ProxyResolverIF;

private import gio.AsyncResultIF;
private import gio.Cancellable;
private import gio.ProxyResolver;
private import gio.ProxyResolverIF;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import gobject.ObjectG;
private import gtkc.gio;
public  import gtkc.giotypes;


/**
 * #GProxyResolver provides synchronous and asynchronous network proxy
 * resolution. #GProxyResolver is used within #GSocketClient through
 * the method g_socket_connectable_proxy_enumerate().
 *
 * Since: 2.26
 */
public interface ProxyResolverIF{
	/** Get the main Gtk struct */
	public GProxyResolver* getProxyResolverStruct();

	/** the main Gtk struct as a void* */
	protected void* getStruct();

	/**
	 */

	/**
	 * Gets the default #GProxyResolver for the system.
	 *
	 * Return: the default #GProxyResolver.
	 *
	 * Since: 2.26
	 */
	public static ProxyResolverIF getDefault();

	/**
	 * Checks if @resolver can be used on this system. (This is used
	 * internally; g_proxy_resolver_get_default() will only return a proxy
	 * resolver that returns %TRUE for this method.)
	 *
	 * Return: %TRUE if @resolver is supported.
	 *
	 * Since: 2.26
	 */
	public bool isSupported();

	/**
	 * Looks into the system proxy configuration to determine what proxy,
	 * if any, to use to connect to @uri. The returned proxy URIs are of
	 * the form `<protocol>://[user[:password]@]host:port` or
	 * `direct://`, where <protocol> could be http, rtsp, socks
	 * or other proxying protocol.
	 *
	 * If you don't know what network protocol is being used on the
	 * socket, you should use `none` as the URI protocol.
	 * In this case, the resolver might still return a generic proxy type
	 * (such as SOCKS), but would not return protocol-specific proxy types
	 * (such as http).
	 *
	 * `direct://` is used when no proxy is needed.
	 * Direct connection should not be attempted unless it is part of the
	 * returned array of proxies.
	 *
	 * Params:
	 *     uri = a URI representing the destination to connect to
	 *     cancellable = a #GCancellable, or %NULL
	 *
	 * Return: A
	 *     NULL-terminated array of proxy URIs. Must be freed
	 *     with g_strfreev().
	 *
	 * Since: 2.26
	 *
	 * Throws: GException on failure.
	 */
	public string[] lookup(string uri, Cancellable cancellable);

	/**
	 * Asynchronous lookup of proxy. See g_proxy_resolver_lookup() for more
	 * details.
	 *
	 * Params:
	 *     uri = a URI representing the destination to connect to
	 *     cancellable = a #GCancellable, or %NULL
	 *     callback = callback to call after resolution completes
	 *     userData = data for @callback
	 *
	 * Since: 2.26
	 */
	public void lookupAsync(string uri, Cancellable cancellable, GAsyncReadyCallback callback, void* userData);

	/**
	 * Call this function to obtain the array of proxy URIs when
	 * g_proxy_resolver_lookup_async() is complete. See
	 * g_proxy_resolver_lookup() for more details.
	 *
	 * Params:
	 *     result = the result passed to your #GAsyncReadyCallback
	 *
	 * Return: A
	 *     NULL-terminated array of proxy URIs. Must be freed
	 *     with g_strfreev().
	 *
	 * Since: 2.26
	 *
	 * Throws: GException on failure.
	 */
	public string[] lookupFinish(AsyncResultIF result);
}
