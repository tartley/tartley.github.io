<!--
.. title: Making a wix installer run a program by default
.. slug: making-a-wix-installer-run-a-program-by-default
.. date: 2009-10-01 18:27:29-05:00
.. tags: Software
.. link: 
.. description: 
.. type: text
-->


***Guest post by my least favourite colleague, Tom.***

Normally - but not always - people want to run a program just after the
install it - you can help then to do this by using an opt-out system
with a checkbox checked by default

To create the checkbox and control whether it is set you must use the
following properties in your **Product** section:

``` xml
Id="WIXUI_EXITDIALOGOPTIONALCHECKBOXTEXT"
Value="Launch the cool program"
Id="WIXUI_EXITDIALOGOPTIONALCHECKBOX"
Value="1"
```

The value of `WIXUI_EXITDIALOGOPTIONALCHECKBOX` controls the
checkboxes checkedness.

You then need a custom action to do some launching:

``` xml
Id="LaunchApplication"
BinaryKey="WixCA"
DllEntry="WixShellExec"
Impersonate="yes"
```

and some UI wiring in the **UI** element under the **Product** element
to get you custom action called.

``` xml
Control="Finish"
Event="DoAction"
Value="LaunchApplication"&gt;WIXUI\_EXITDIALOGOPTIONALCHECKBOX = 1 and
NOT Installed
```

Huzzah - you now may have a working installer.