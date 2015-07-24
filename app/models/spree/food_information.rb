module Spree
  class FoodInformation < ActiveRecord::Base


    # https://de.wikipedia.org/wiki/Lebensmittel-Informationsverordnung#cite_note-5
    # string: description a) Bezeichnung des Lebensmittels:
    # string: ingredients (gut wäre hier natürlich eine Liste...) b) Verzeichnis der Zutaten # id ZTVZ / name ZTVZ / featuregroup Stammdaten
    # c) die Zutaten und Hilfsstoffe (sowie deren Derivate) gemäß Anhang II, die Allergien und Unverträglichkeiten auslösen,
    # d) die Menge bestimmter Zutaten,
    # string e) die Nettofüllmenge, nettoinhalt
    # f) das Mindesthaltbarkeitsdatum oder Verbrauchsdatum,
    # g) ggf. besondere Anweisungen für Aufbewahrung und/oder Verwendung,
    # h) der Name und die Anschrift des Lebensmittelunternehmers,
    # i) das Ursprungsland oder der Herkunftsort (falls nach Art. 26 vorgesehen),
    # j) eine Gebrauchsanleitung (falls erforderlich),
    # k) die Angabe des Alkoholgehalts für Getränke mit mehr als 1,2 Vol.-% Alkohol sowie
    # l) eine Nährwertdeklaration.


    serialize :ingredients, Array
    serialize :nutrition_information, Array
    belongs_to :product


  end
end
