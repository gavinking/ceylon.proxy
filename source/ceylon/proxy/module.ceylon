"Defines a function for proxying Ceylon objects."
module ceylon.proxy "1.0.0" {
    import ceylon.collection "1.3.2-SNAPSHOT";
    native("jvm") import ceylon.interop.java "1.3.2-SNAPSHOT";
    native("jvm") import maven:"net.bytebuddy:byte-buddy" "1.5.8";
    native("jvm") import java.base "7";
}
