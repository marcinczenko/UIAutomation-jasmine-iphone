jasmine.UIAutomation = {};

// Jasmine assumes that the underlying driver (such as a browser) will need xxxx
// access to the thread of execution to update its UI.  This attribute specifies
// how often Jasmine will use a setTimeout call to relinquish the main thread.
// The UIAutomation framework doesn't support setTimout, nor does it need access
// to the main thread, since UI updates happen via API calls that marshall to
// the separate Instruments process.  Setting this to 0 tells Jasmine to never
// give up the main thread.
jasmine.getEnv().updateInterval = 0;

jasmine.UIAutomation.Reporter = function() {
  var self = new jasmine.Reporter();
  
  self.reportSpecStarting = function(spec) {
    UIALogger.logStart(spec.getFullName());
  };
  
  self.reportSpecResults = function(spec) {
    var results = spec.results();
    if (results.passed()) {
      UIALogger.logPass("Passed");
    } else {
//      UIATarget.localTarget().captureScreenWithName(spec.getFullName());
      UIALogger.logFail(failureMessageFor(results));
    }
  };
  
  self.log = function(string) {
    UIALogger.logDebug(string);
  };
  
  return self;
  
  function failureMessageFor(results) {
    var message = "";
  
    var resultItems = results.getItems();
    for (var i = 0; i < resultItems.length; ++i) {
      var result = resultItems[i];
      if (result.passed && !result.passed()) {
        message += result.message + "\n";
      }
    }
    return message;
  }
};
