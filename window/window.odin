package window

import "vendor:glfw"
import "core:fmt"
import "core:os"
Setting :: enum
{
    Resize, 
    Windowed, 
    FullScreen, 
    WindowedFullScreen
}

component :: struct 
{
    width : i32,
    height : i32,
    name : string,
    window : glfw.WindowHandle,
    primary : glfw.MonitorHandle,
    mode : ^glfw.VidMode,
    setting : Setting
}

ErrorProc :: #type proc "c" (error: int, description: cstring)

error_callback :: ErrorProc = proc(error: int, description: cstring) {
    fmt.println("GLFW Error: ", description);
};


//Destructor of the window. This should be deferred upon window creation
destruct :: proc(cmp: component){
    glfw.DestroyWindow(cmp.window);
    glfw.Terminate();
}

//Initialize the window
init :: proc(cmp: ^component, title: string, w: i32, h: i32){
    
    // initialize glfw
    glfw.Init();
    glfw.WindowHint(glfw.CONTEXT_VERSION_MAJOR, 4);
    glfw.WindowHint(glfw.CONTEXT_VERSION_MINOR, 6);
    glfw.WindowHint(glfw.OPENGL_PROFILE, glfw.OPENGL_CORE_PROFILE);
    glfw.WindowHint(glfw.OPENGL_FORWARD_COMPAT, glfw.TRUE);

    cmp.primary = glfw.GetPrimaryMonitor();
    cmp.mode = glfw.GetVideoMode(cmp.primary);

    glfw.WindowHint(glfw.RED_BITS, cmp.mode.red_bits);
    glfw.WindowHint(glfw.GREEN_BITS, cmp.mode.green_bits);
    glfw.WindowHint(glfw.BLUE_BITS, cmp.mode.blue_bits);
    glfw.WindowHint(glfw.REFRESH_RATE, cmp.mode.refresh_rate);

    //Set context
    glfw.MakeContextCurrent(cmp.window);
    glfw.SwapInterval(1);

    //Set the callbacks
    glfw.SetErrorCallback(error_callback);

}
