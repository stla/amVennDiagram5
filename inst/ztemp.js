// Create wrapper container
var container = root.container.children.push(
  am5.Container.new(root, {
    width: am5.p100,
    height: am5.p100,
    layout: root.horizontalLayout
  })
);
// Create venn series
var chart = container.children.push(
  am5venn.Venn.new(root, {
    categoryField: "name",
    valueField: "count",
    intersectionsField: "sets",
    paddingTop: 40,
    paddingBottom: 40,
    paddingLeft: 40,
    paddingRight: 40
  })
);
// Set data
chart.data.setAll(x.data);
// Add legend
var legend = container.children.push(
  am5.Legend.new(root, {
    layout: root.verticalLayout,
    centerX: am5.p100,
    x: am5.p100,
    centerY: am5.p50,
    y: am5.p50
  })
);
legend.data.setAll(chart.dataItems);
