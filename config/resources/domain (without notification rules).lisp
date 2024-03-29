(in-package :mu-cl-resources)

(define-resource BesluitType ()
  :class         (s-prefix "skos:Concept")
  :properties    `((:preflabel          :string ,(s-prefix "skos:prefLabel")
                                        :required)
                   (:definition         :string ,(s-prefix "skos:definition")
                                        :required)
                   (:obligationtoreport :boolean ,(s-prefix "besluit:obligationToReport")
                                        :required))
                   ;(:decidableBy         :uri-set ,(s-prefix "besluit:decidableBy")))
  :has-one       `((BesluitType :via ,(s-prefix "skos:broader")
                                :as  "parenttype"))
  :has-many      `((BesluitType :via ,(s-prefix "skos:broader")
                                :inverse t
                                :as  "subtypes")
                   (BestuurseenheidClassificatieCode :via ,(s-prefix "besluit:decidableBy")
                                :as "decidableby"))
  :resource-base (s-url "https://data.vlaanderen.be/id/concept/BesluitType/")
  :on-path       "besluittype")

(define-resource BesluitDocumentType ()
  :class         (s-prefix "skos:Concept")
  :properties    `((:preflabel          :string ,(s-prefix "skos:prefLabel")
                                        :required)
                   (:definition         :string ,(s-prefix "skos:definition")
                                        :required)
                   (:obligationtoreport :boolean ,(s-prefix "besluit:obligationToReport")
                                        :required))
  :has-many      `((BestuurseenheidClassificatieCode :via ,(s-prefix "besluit:decidableBy")
                                                     :as "decidableby"))
  :resource-base (s-url "https://data.vlaanderen.be/id/concept/BesluitDocumentType/")
  :on-path       "besluitdocumenttype")

(define-resource BestuurseenheidClassificatieCode ()
  :class         (s-prefix "skos:Concept")
  :properties    `((:preflabel :string ,(s-prefix "skos:prefLabel")))
  :resource-base (s-url "http://data.vlaanderen.be/id/concept/BestuurseenheidClassificatieCode/")
  :on-path       "bestuurseenheidclassificatiecode")

