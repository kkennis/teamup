$(document).ready(function() {
  updateStories();

  $("div.panel-heading").next(".user-page").slideUp("fast");

  $("div.panel-heading").click(function(){
    $(this).next(".user-page").slideToggle("slow");
  });

});


function updateStories(){
  var team_names = [];
  var team_classes = [];
  
  $.ajax({
    url: "https://www.kimonolabs.com/api/dp2fr06w?apikey=RVGH7NXcr496gz5BGNjs805SWZvp2ATs",
    method: "GET",
    dataType: "jsonp"
  })
  .done(function(data){
    
    $.map(data["results"]["nflTeams"], function(team, index){
      team_names.push(team["teamName"]["href"]);
    });

    $.map(team_names, function(team_name, index){
      var team_class = team_name.split("/").pop().replace(/-/g,"_");
      if ($("div.stories").hasClass(team_class)){
        getESPNStories(team_name);
      };
    });
  });
  
}

function getESPNStories(team_name){
  var stories = $.ajax({
    url: "https://www.kimonolabs.com/api/7ki3w3bq?apikey=RVGH7NXcr496gz5BGNjs805SWZvp2ATs",
    method: "GET",
    dataType: "jsonp"
  })
  .done(function(data){
    var teamStories = data["results"]["nflStories"].filter((story) => story.url == team_name);
    $.map(teamStories.slice(0,5), function(story){
      var team = story.url.split("/").pop().replace(/-/g,"_");
      $("div." + team).append("<p>ESPN - <a href='" + story.title.href + "'>" + story.title.text + "</a></p><hr>");
    })
  })
}