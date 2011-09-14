#ifdef DEBUG
#   define XLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define XLog(...)
#endif

#ifdef DEBUG
#   define Log NSLog
#else
#   define Log(...)
#endif