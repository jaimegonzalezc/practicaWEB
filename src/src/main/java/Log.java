import java.util.logging.LogManager;
import java.util.logging.Logger;

public class Log {
    public static Logger log = LogManager.getLogManager().getLogger("log");
    public static Logger logdb = LogManager.getLogManager().getLogger("logdb");
}
