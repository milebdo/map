    
angular.module('ngMap')
.controller('ngFeatureInfo', ['$scope', 'ngMapBuilder', 
function ($scope, ngMapBuilder) {
    
    /**
     * Scope models
     */
    $scope.item = false;
    $scope.template = '';
    
    /**
     * Clear feature info
     * 
     * @returns {undefined}
     */
    $scope.clearInfo = function () {
        $scope.item = false;
        $scope.template = '';
    };
    
    /**
     * Init seach results
     * 
     * @returns {undefined}
     */
    var init = function () {
        
//        var vectorLayer = new OpenLayers.Layer.Vector("Overlay");
        
        var container = document.getElementById('popup');
        var overlay = new ol.Overlay({
          element: container,
          autoPan: true,
          autoPanAnimation: {
            duration: 250
          }
        });
        ngMapBuilder.getMap().addOverlay(overlay);

        var closer = document.getElementById('popup-closer');
            closer.onclick = function() {
            overlay.setPosition(undefined);
            closer.blur();
            return false;
        };
        var content = document.getElementById('popup-content');
        ngMapBuilder.getMap().on('singleclick', function (evt) {
            // Search features on mouse position
            var pixel = ngMapBuilder.getMap().getEventPixel(evt.originalEvent);
            var attributes = ngMapBuilder.getMap().forEachFeatureAtPixel(pixel, function (feature, layer) {
                console.log(layer);
                return feature;
            });
            var coordinate = evt.coordinate;
            var result = attributeContent(attributes.getProperties(), attributes.getKeys());
            content.innerHTML = result;
            overlay.setPosition(coordinate);       
        });
        
        function attributeContent(attributes, keys) {
            var result = '';
            for (var value in attributes) {
                if (value !== null && value !== 'geometry' &&
                    value !== 'PROVNO' && value !== 'KABKOTNO' &&
                    value !== 'KECNO' && value !== 'DESANO' &&
                    value !== 'DESA_1' && value !== 'ID2012' &&
                    value !== 'ID2013' && value !== 'IDKAB2' && value !== 'IDKEC_2') {
                    var content = attributes[value];
                    if (value == 'DESA') value = 'KELURAHAN';
                    result += value +': '+ content + '<br/>';
                }
            }
            return result;
          }

        // Capture mouse move event and change pointer over feature
        ngMapBuilder.getMap().on('pointermove', function (evt) {
            if (evt.dragging) {
                return;
            }
            ngMapBuilder.getMap().getTargetElement().style.cursor = ngMapBuilder.getMap().hasFeatureAtPixel(evt.pixel) ? 'pointer' : '';
            // Get features on mouse position
            var pixel = ngMapBuilder.getMap().getEventPixel(evt.originalEvent);
            var features = [];
            ngMapBuilder.getMap().forEachFeatureAtPixel(pixel, function (feature, layer) {
                features.push(feature);
            });
            
            // Change pointer
            if (features.length > 0) {
                angular.element(ngMapBuilder.getMap().getTargetElement()).css('cursor', 'pointer');
            } else {
                angular.element(ngMapBuilder.getMap().getTargetElement()).css('cursor', '');
            }
            
        });
        
        // Apply
       $scope.$apply();
        
    };
    
    /**
     * Load map and build search ui
     */
    ngMapBuilder.ready(function () {
        init();
    });
    
}]);

