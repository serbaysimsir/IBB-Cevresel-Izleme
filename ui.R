library(shiny)
library(readxl)
library(shinydashboard)
library(shinyWidgets)
library(DT)
library(plotly)
tarihsaat <<- read_excel("database/tarihsaat.xlsx")
co <<- read_excel("database/CO.xlsx")
radrasyon <<- read_excel("database/Radrasyon.xlsx")
basinc <<- read_excel("database/havabasinci.xlsx")
sicaklik <<- read_excel("database/havasicakligi.xlsx")
no <<- read_excel("database/NO.xlsx")
no2 <<- read_excel("database/NO2.xlsx")
nox <<- read_excel("database/NOX.xlsx")
nem <<- read_excel("database/Nem.xlsx")
pm10 <<- read_excel("database/PM10.xlsx")
pm25 <<- read_excel("database/PM2.5.xlsx")
hiz <<- read_excel("database/ruzgarhizi.xlsx")
yon <<- read_excel("database/ruzgaryon.xlsx")
so2 <<- read_excel("database/SO2.xlsx")
ui <- fluidPage(
    setBackgroundImage(
        src = "background.svg"
    ),
    headerPanel(div(img(style="width : 25%" , src="logo.png"), h1("İBB 2020 YILI LOKASYON BAZINDA ", br(), "ÇEVRESEL İZLEME VE KONTROL VERİLERİ"), align = "center") , windowTitle = "İBB ÇEVRESEL İZLEME VE KONTROL VERİLERİ"),
    fluidRow(
        box(width = 4, selectInput("ilce", label="İLÇE", choices = c("Aksaray","Alibeyköy","Arnavutköy","Avcılar","Bağcılar","Başakşehir","Beşiktaş","Büyükada","Çatladıkapı", "Esenler","Esenyurt", "Göztepe", "Kadıköy", "Kağıthane 1", "Kağıthane 2", "Kandilli 1", "Kandilli 2", "Kartal", "Kumköy", "Maslak", "Mecidiyeköy", "Sancaktepe", "Sarıyer", "Selimiye", "Silivri", "Sultanbeyli", "Sultangazi 1", "Sultangazi 2", "Sultangazi 3", "Sultangazi 4", "Şile", "Şirinevler", "Tuzla", "Ümraniye 1", "Ümraniye 2","Üsküdar 1", "Üsküdar 2", "Yenibosna"), selected = "Beşiktaş", width='100%')),
        box(width = 4, selectInput("öznitelik", label="ÖZNİTELİK", choices = c("CO","Güneş Radrasyon","Hava Basıncı","Hava Sıcaklığı","NO","NO2","NOX","Nem", "PM10", "PM2.5", "Rüzgar Hızı", "Rüzgar Yönü", "SO2" ), selected = "CO", width='100%')),
        box(width = 4, selectInput("grafikturu", label="GRAFİK TÜRÜ", choices = c("Çizgi Grafiği","Nokta Grafiği","Çizgi ve Nokta Grafiği" ,"Bar Grafiği"), selected = "Çizgi Grafiği", width='100%'))
        
    ),
    fluidRow(
        br(),
        box(width = 12, plotlyOutput("grafik"))
    ),
    fluidRow(
        br(),
        box(width=12,dataTableOutput("tablo"))
    )
)