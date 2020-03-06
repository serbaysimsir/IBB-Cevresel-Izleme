server <- function(input, output) {
    output$grafik <- renderPlotly({
        eksenad <- paste(input$ilce, ' (Değer)', sep="")
        tip <- ""
        if(input$grafikturu == "Çizgi Grafiği")
            tip = "lines"
        else if(input$grafikturu == "Nokta Grafiği")
            tip = "markers"
        else if(input$grafikturu == "Çizgi ve Nokta Grafiği")
            tip = "lines+markers"
        else if(input$grafikturu == "Bar Grafiği")
            tip = "bar"
        veri <- NULL
        parametre <- ""
        if(input$öznitelik == "Güneş Radrasyon"){
            veri = radrasyon
            parametre = "Güneş Radyasyon (w/m²)"
        }
        else if(input$öznitelik == "Hava Basıncı")
        {
            veri = basinc
            parametre = "Hava Basınç (mbar)"
        }
        else if(input$öznitelik == "Hava Sıcaklığı")
        {
            veri = sicaklik
            parametre = "Hava Sıcaklığı (°C)"
        }
        else if(input$öznitelik == "Rüzgar Hızı")
        {
            veri = hiz
            parametre = "Rüzgar Hızı (m/sn)"
        }
        else if(input$öznitelik == "Rüzgar Yönü")
        {
            veri = yon
            parametre = "Rüzgar Yön (°)"
        }
        else if(input$öznitelik == "CO")
        {
            veri = co
            parametre = "CO (µg/m³)"
        }
        else if(input$öznitelik == "NO")
        {
            veri = no
            parametre = "NO (µg/m³)"
        }
        else if(input$öznitelik == "NO2")
        {
            veri = no2 
            parametre = "NO2 (µg/m³)"
        }
        else if(input$öznitelik == "NOX")
        {
            veri = nox
            parametre = "NOX (µg/m³)"
        }
        else if(input$öznitelik == "Nem")
        {
            veri = nem
            parametre = "Nem (%)"
        }
        else if(input$öznitelik == "PM10")
        {
            veri = pm10 
            parametre = "PM10 (µg/m³)"
        }
        else if(input$öznitelik == "PM2.5")
        {
            veri = pm25
            parametre = "PM2.5 (µg/m³)"
        }
        else if(input$öznitelik == "SO2")
        {
            veri = so2 
            parametre = "SO2 (µg/m³)"
        }
        degerler <- as.data.frame(veri[,eksenad], drop=false)
        colnames(degerler) <- c("Y")
        output$tablo <- renderDataTable({
            #Selecting columns
            data <- cbind.data.frame(tarihsaat$Tarih , degerler$Y )
            #Naming of columns
            colnames(data) <- c("Tarih ve Saat", parametre)
            #Creation of table
            vanilla.table = datatable(data, rownames = FALSE, selection="multiple", escape=FALSE, options = list(pageLength = 5, lengthChange = TRUE, sDom  = '<"top">lrt<"bottom">ip', columnDefs = list(list(className = 'dt-center', targets="_all"))))
        })
        baslik = paste('<b>',input$ilce, ' İlçesi ',input$öznitelik, ' Grafiği </b>', sep="")
        p <- plot_ly(degerler, x=~tarihsaat$Tarih , y=~degerler$Y, type = 'scatter', mode=tip) %>%
            layout(
                title = baslik, xaxis = list(title = "<b>Tarih ve Saat</b>", showline = TRUE, mirror = "ticks", zeroline=FALSE), yaxis = list(title = paste('<b>', parametre ,'</b>', sep=""),  showline = TRUE, mirror = "ticks", zeroline=FALSE ), showlegend = FALSE, xaxis = list(title="")
            )
    })
}