import com.thoughtworks.gauge.Step;
import com.thoughtworks.gauge.Table;
import com.thoughtworks.gauge.TableRow;

import java.util.HashSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.junit.Assert.*;

public class StepImplementation {
  String email_regex = "^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";
  Pattern pattern = Pattern.compile(email_regex);

  @Step({"verify that email with dot com <email> is valid", "verify that email with dot co.in <email> is valid", "verify that email with underscore <email> is valid"})
  public void validEmailFormat(String email) {
    Matcher matcher = pattern.matcher(email);
    assertEquals(matcher.matches(),true);
  }

  @Step("verify that email <email> is invalid")
  public void invalidEmailFormat(String email) {
    Matcher matcher = pattern.matcher(email);
      assertEquals(matcher.matches(),false);
  }

  @Step("verify emails <emails>")
  public void invalidEmailFormats(Table emails) {
    for (TableRow row : emails.getTableRows()) {
        String emailId = row.getCell("id");
        Matcher matcher = pattern.matcher(emailId);
        boolean expected = Boolean.parseBoolean(row.getCell("is valid"));
        assertEquals("validation on email "+emailId+" is failing",expected, matcher.matches());
    }
  }
}
