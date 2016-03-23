$.ajax({
           type: "GET",
           contentType: "application/json; charset=utf-8",
           url: '/charts/data',
           dataType: 'json',
           success: function (data) {
               draw(data);
           },
           error: function (result) {
               error();
           }
       });
function draw(data){
  // width and height 
    var w = 715;
    var h = 400;
    var barPadding = 1;

  // pulls price out of every record to graph
   a = [];
   sum = 0
    for (i = 0; i < data.length; i++) {
        // console.log(data[i].price);
        sum += parseInt(data[i].price,10);
        a.push(data[i].price);
    }
    avg = d3.round(sum/a.length)
    // console.log(a);
    // console.log(sum);
    // console.log(avg);

  // select svg element
    var svg = d3.select("#graph")
                .attr("width", w)
                .attr("height", h);

  // creating rect's inside the svg
          svg.selectAll("rect")
            .data(a)
            .enter()
            .append("rect")
            .attr("class","bar")
            // creatin a rect's location dynamic on the x coordinate 
            .attr("x", function(d,i){
              return i * (w / a.length);
            })
            // flipping the graph 
            // the "y" / number should be the same as with "height" / number
            .attr("y", function(d){
              return h - d / 30;
            })

            .attr("width", w / a.length - barPadding)
            // making rect height dynamic adjust d/ number to increase or decrease bar height
            .attr("height", function(d) {
              return d / 30;
            })
            // rect colors
            .attr("fill","steelblue");

          svg.append("line")
            // .data(avg)
            .attr("x1", 0)
            .attr("y1", h - avg/30)
            .attr("x2", w)
            .attr("y2", h - avg/30)
            .attr("class","line")
            .attr("stroke-width", 2)
            .attr("stroke", "black");

          // adding text 
          svg.selectAll("text")
            .data(a)
            .enter()
            .append("text")
            .text(function(d){
              return "$"+(d3.round(d));
            })

            // position text on the x axis
            .attr("x", function(d,i){
              return i * (w / a.length) + 5;
            })

            // position text y axis
            .attr("y", function(d){
              return h - (d / 30) +15;
            })
            .attr("class","chart_text")
            .attr("font-family", "Arial")
            .attr("font-size", "11px")
            .attr("fill", "white");

            svg.append("text")
            .text(function(d){
              return "Average Price $"+(d3.round(avg));
            })
            .attr("x", w - 125)
            .attr("y", h - avg/29)
            .attr("class","mean_text")
            .attr("font-family", "Arial")
            .attr("font-size", "11px")
            .attr("fill", "black");
}

// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

  // LINE CHART 

// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
$.ajax({
           type: "GET",
           contentType: "application/json; charset=utf-8",
           url: '/charts/num_of_jobs',
           dataType: 'json',
           success: function (data) {
               numOfJobs(data);
           },
           error: function (result) {
               error();
           }
       });
function numOfJobs(data){
    console.log(data);
    var current
    var months = ["","January","February","March","April","May","June","July","August","September","October","November","December"];
    var monthToJobsArr = []
    var monthToJobs = {"1":"0" , "2":"0" , "3":"0" , "4":"0" , "5":"0" , "6":"0" , "7":"0" , "8":"0" , "9":"0" , "10":"0" , "11":"0" , "12":"0"};
    var optData = [] // this is my array of objects


    for (var i = 1; i <= 12; i++ ){
      var dataHash = {};
      if (data[i]){
        dataHash.date = months[i];// Assigning month to dataHas
        dataHash.jobs = data[i].length;// Assigning number of jobs to dataHash
        monthToJobs[i] = data[i].length;
        monthToJobsArr.push(data[i].length);
        optData.push(dataHash);  // pushing dataHash into optData
      }
      else {
        dataHash.x = months[i];
        dataHash.y = 0
        monthToJobs[i] = 0;
        monthToJobsArr.push(0);
        optData.push(dataHash); 
      }
    }
    console.log(monthToJobs);
    console.log(monthToJobsArr);
    console.log(optData);

    /// gonna be honest and i copied a lot of this shit but i have a gist of an idea of what it all does but i'm not too solid bout it. 

    // width and height 
    var w = 715;
    var h = 400;
    var margin = {left: 30, top: 30, right: 30, bottom: 30};
    var innerW = w - margin.left - margin.right;
    var innerH = h - margin.top - margin.bottom;
    
    var parseDate = d3.time.format("%d-%b-%y").parse;

    var xScale = d3.time.scale()
      .range([0,w]);

    var yScale = d3.scale.linear()
      .range([h,0]);

    var xAxis = d3.svg.axis()
      .scale(xScale)
      .orient("bottom");

    var yAxis = d3.svg.axis()
      .scale(yScale)
      .orient("left")

    var line = d3.svg.line()
      .x(function(d) { return xScale(d.date); })
      .y(function(d) { return yScale(d.jobs); })

    // select svg element
    var svg = d3.select("#num_jobs_graph_container").append("svg")
        .attr("width", w)
        .attr("height", h)
      .append("g")
        .attr("transform","translate("+margin.left+","+margin.top+ ")");

    x.domain(d3.extent(data, function(d){ return d.date; }));
    y.domain(d3.extent(data, function(d){ return d.jobs; }));

    svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0,"+h+")")
      .call(xAxis);

    svg.append("g")
      .attr("class", "y axis")
      .call(yAxis)
     .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Jobs Per Month");

    svg.append("path")
      .datum(data)
      .attr("class", "line")
      .attr("d", line)


    // var g = svg.append("g")
    //     .attr("transform", "translate("+margin.left+","+margin.top+")");
    // var xAxisG = g.append("g")
    //     .attr("transform", "translate(0," + innerHeight/2.1 + ")");
    // var yAxisG = g.append("g");

    // var xScale = d3.scale.linear().range([0,innerW]);
    // var yScale = d3.scale.linear().range([innerH,0]);

    // var xAxis = d3.svg.axis()
    // .scale(xScale)
    // .orient("bottom");
    // // .ticks(d3.time.months)
    // // .tickSize(16, 0)
    // // .tickFormat(d3.time.format("%B"));
    // var yAxis = d3.svg.axis().scale(yScale).orient("left");

    // function render(data){

    //   xScale.domain([1,12]);
    //   yScale.domain([0,d3.max(monthToJobsArr)]);

    //   xAxisG.call(xAxis);
    //   yAxisG.call(yAxis);

    //   var circles = g.selectAll("circle").data(data);
    //   circles.enter().append("circle")
    //     .attr("r", circleRadius);

    //   circles
    //     .attr("cx",function(d){ return xScale(d);})
    //     .attr("cy", function(d){ return yScale(d);});

    //   circles.exit().remove();
    // }

    // render(monthToJobsArr);
                
}