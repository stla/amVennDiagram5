HTMLWidgets.widget({
  name: "amVennDiagram",

  type: "output",

  factory: function (el, width, height) {
    // TODO: define shared variables for this instance

    return {
      renderValue: function (x) {
        // Create root
        var root = am5.Root.new(el.id);
        // Set themes
        switch (x.theme) {
          case "dark":
            root.setThemes([am5themes_Animated.new(root), am5themes_Dark.new(root)]);
            break;
          case "dataviz":
            root.setThemes([am5themes_Animated.new(root), am5themes_Dataviz.new(root)]);
            break;
          case "frozen":
            root.setThemes([am5themes_Animated.new(root), am5themes_Frozen.new(root)]);
            break;
          case "kelly":
            root.setThemes([am5themes_Animated.new(root), am5themes_Kelly.new(root)]);
            break;
          case "material":
            root.setThemes([am5themes_Animated.new(root), am5themes_Material.new(root)]);
            break;
          case "moonrise":
            root.setThemes([am5themes_Animated.new(root), am5themes_Moonrise.new(root)]);
            break;
          case "spirited":
            root.setThemes([am5themes_Animated.new(root), am5themes_Spirited.new(root)]);
            break;
          default:
            root.setThemes([am5themes_Animated.new(root)]);
        }
        // Create wrapper container
        var container = root.container.children.push(
          am5.Container.new(root, {
            width: am5.p100,
            height: am5.p100,
            layout: root.verticalLayout
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
        // Set tooltip content
        chart.slices.template.set("tooltipText", "{category}: {value}");
        // Set up hover appearance
        chart.hoverGraphics.setAll({
          strokeDasharray: [3, 3],
          stroke: am5.color(0xffffff),
          strokeWidth: 2
        });
        // Add legend
        var legend = container.children.push(
          am5.Legend.new(root, {
            centerX: am5.p50,
            x: am5.p50
          })
        );
        legend.data.setAll(chart.dataItems);
      },

      resize: function (width, height) {
        // TODO: code to re-render the widget with a new size
      }
    };
  }
});
