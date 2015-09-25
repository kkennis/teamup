$(document).ready(function() {

  if ($(".sport-title").hasClass("football")) {
    console.log("football page");
    getFootballStories();
  }

  if ($(".sport-title").hasClass("baseball")) {
    console.log("baseball page");
    getBaseballStories();
  }

  $("div.panel-heading").next(".user-page").slideUp("fast");

  $("div.panel-heading").click(function(){
    $(this).next(".user-page").slideToggle("slow");
  });

});


function getFootballStories(){
  var team_names = [];
  var team_classes = [];

  $.ajax({
    url: "https://www.kimonolabs.com/api/dp2fr06w?apikey=RVGH7NXcr496gz5BGNjs805SWZvp2ATs",
    method: "GET",
    dataType: "jsonp"
  })
  .done(function(data){

    var sport = ""


    $.map(data["results"]["nflTeams"], function(team, index){
      team_names.push(team["teamName"]["href"]);
    });

    $.map(team_names, function(team_name, index){
      var team_class = team_name.split("/").pop().replace(/-/g,"_");
      if ($("div.stories").hasClass(team_class)){
        getESPNStories(team_name, "football");
      };
    });
  });

}

function getESPNStories(team_name, sport){
  var url = "";
  console.log("yeah baby");
  if (sport === "football") {
    url = "https://www.kimonolabs.com/api/7ki3w3bq?apikey=RVGH7NXcr496gz5BGNjs805SWZvp2ATs"
  } else if (sport === "baseball") {
    console.log("Scraping baseball API...");
    url = "https://www.kimonolabs.com/api/d1rs0uss?apikey=RVGH7NXcr496gz5BGNjs805SWZvp2ATs"
  }
  var stories = $.ajax({
    url: url,
    method: "GET",
    dataType: "jsonp"
  })
  .done(function(data){
    var teamStories = data["results"]["nflStories"].filter((story) => story.url == team_name);
    $.map(teamStories, function(story){
      var team = story.url.split("/").pop().replace(/-/g,"_");
      $("div." + team).append("<p>ESPN - <a href='" + story.title.href + "'>" + story.title.text + "</a></p><hr>");
    })
  })
}

function getBaseballStories(){
  var team_names = [];
  var team_classes = [];


  $.ajax({
    url: "https://www.kimonolabs.com/api/bcrpvef0?apikey=RVGH7NXcr496gz5BGNjs805SWZvp2ATs",
    method: "GET",
    dataType: "jsonp"
  })
  .done(function(data){

    console.log("baseballing");
    $.map(data["results"]["nflTeams"], function(team, index){
      team_names.push(team["teamName"]["href"]);
    });

    $.map(team_names, function(team_name, index){
      var team_class = team_name.split("/").pop().replace(/-/g,"_");
      if ($("div.stories").hasClass(team_class)){
        console.log("We got the class");
        getESPNStories(team_name, "baseball");
      };
    });
  })
  .fail(function(){
    console.log("Request failed");
  })
}
