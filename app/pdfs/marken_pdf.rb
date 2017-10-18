class MarkenPdf < Prawn::Document
  require 'barby/barcode/code_39'
  require 'barby/outputter/prawn_outputter'

  def initialize(teams)
    super()
    teams.each do |team|
      createMarkenTeam(team.barcodes.count, team.barcodes, team.gender)
      start_new_page
    end

  end

  def createMarkenTeam(anzahl, barcodes, gender)
    x = 0
    y = 715
    itemPerPage = 0
    barcodeCount = 0
    for i in 1..anzahl
      if itemPerPage == 8 then
        start_new_page
        x = 0
        y = 715
        for a in 1..8
          markeHinten(x,y, barcodes[i-1-a].id, gender)
          barcodeCount = barcodeCount + 1

          if x == 0 then
            x = 267.5
          else
            x = 0
            y = y-178.75
          end
        end
        start_new_page
        itemPerPage = 0
        x = 0
        y = 715
      end
      markeVorne(x,y,gender)
      itemPerPage = itemPerPage + 1

      if x == 0 then
        x = 267.5
      else
        x = 0
        y = y-178.75
      end

      if i == anzahl then
        start_new_page
        x = 0
        y = 715
        leftbarcodes = anzahl - barcodeCount
        for b in 1..leftbarcodes
          markeHinten(x,y, barcodes[i-b].id, gender)

          if x == 0 then
            x = 267.5
          else
            x = 0
            y = y-178.75
          end
        end
      end
    end
  end

  def markeVorne(x,y,gender)
    bounding_box([x, y], width: 267.5, height: 178.75) do
      text_box "10€", at: [15,163], size: 30
      text_box setGender(gender), at:[120,163], size: 30
      text_box "ÖPC", at: [190,163], size: 30
      data = [
        ['0,50', '0,50', '0,50', '0,50', '0,50'],
        ['0,50', '0,50', '0,50', '0,50', '0,50'],
        ['0,50', '0,50', '0,50', '0,50', '0,50'],
        ['0,50', '0,50', '0,50', '0,50', '0,50']
        ]
      bounding_box([0,128.5], width: 267.5) do
        table(data, width: 257.5, position: 5, cell_style: {align: :center, size: 18})
      end
      stroke_bounds
    end
  end

  def markeHinten(x,y, barcode, gender)
    bounding_box([x, y], width: 267.5, height: 178.75) do
      barcode = Barby::Code39.new(barcode.to_s)
      outputter = Barby::PrawnOutputter.new(barcode)
      outputter.annotate_pdf(self, x:100, y:60)
      text_box barcode.to_s, at: [10,20]
      text_box setGender(gender), at: [10, 170]
      stroke_bounds
    end
  end

  def setGender(gender)
    if gender then
      genderText = "M"
    else
      genderText = "W"
    end

    return genderText
  end
end
