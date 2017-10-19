class PagesController < ApplicationController
  def index
    maleteams = Team.where(gender: true)
    femaleteams = Team.where(gender: false)
    maleAmount = []
    maleLabels = []
    femaleAmount = []
    femaleLabels = []
    maleteams.each do |a|
      maleAmount.push a.amount
      maleLabels.push a.name
    end
    femaleteams.each do |a|
      femaleAmount.push a.amount
      femaleLabels.push a.name
    end
    gon.maleteamsAmount = maleAmount
    gon.maleteamsLabels = maleLabels
    gon.femaleteamsAmount = femaleAmount
    gon.femaleteamsLabels = femaleLabels
  end

  def scanner

  end

  def addScan
      barcode = Barcode.find(params[:id])
      team = barcode.team
      if barcode.scan == false then
        barcode.scan = true
        team.amount = team.amount + 10
        team.save
        barcode.save
      end
      redirect_to pages_scanner_path
  end
end
