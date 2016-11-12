+++
title = "PhD Thesis (French)"
draft = true
date = "2012-02-01T08:31:46Z"

+++

## Introduction

Cette thèse a été soutenue le 14 Février 2012, et portait principalement sur les problématiques de la correction du mouvement respiratoire en imagerie TEP (Tomographie par émission de Positon). J'y présente une technique originale d'évaluation automatisée de la détectabilité des lésions, ainsi que la création d’une base de données patients simulés.

**Evaluation de la correction du mouvement respiratoire sur la détection des lésions en oncologie TEP**

* [Manuscrit de Thèse](files/phd-thesis.pdf)
* [Présentation de Thèse](files/phd-slides.pptx)

## Résumé

La tomographie par émission de positons (TEP) est une méthode d’imagerie clinique en forte expansion dans le domaine de l’oncologie. De nombreuses études cliniques montrent que la TEP permet, d’une part de diagnostiquer et caractériser les lésions cancéreuses à des stades plus précoces que l’imagerie anatomique conventionnelle, et d’autre part d’évaluer plus rapidement la réponse au traitement. Le raccourcissement du cycle comprenant le diagnostic, la thérapie, le suivi et la réorientation thérapeutiques contribue à augmenter le pronostic vital du patient et maîtriser les coûts de santé.

La durée d’un examen TEP ne permet pas de réaliser une acquisition sous apnée. La qualité des images TEP est par conséquent affectée par les mouvements respiratoires du patient qui induisent un flou dans les images. Les effets du mouvement respiratoire sont particulièrement marqués au niveau du thorax et de l’abdomen.

Plusieurs types de méthode ont été proposés pour corriger les données de ce phénomène, mais elles demeurent lourdes à mettre en place en routine clinique. La problématique de la correction du mouvement respiratoire et le choix de la méthode appropriée sont des sujets d’actualité au sein de la communauté de médecine nucléaire. Des travaux récemment publiés proposent une évaluation de ces méthodes basée sur des critères de qualité tels que le rapport signal sur bruit ou le biais. Aucune étude à ce jour n’a évalué l’impact de ces corrections sur la qualité du diagnostic clinique. Ce problème pose des questions d’orientation stratégique et financière importantes.

Nous nous sommes focalisés sur la problématique de la détection des lésions du thorax et de l’abdomen de petit diamètre et faible contraste, qui sont les plus susceptibles de bénéficier de la correction du mouvement respiratoire en routine clinique.

Nos travaux ont consisté dans un premier temps à construire une base d’images TEP qui modélisent un mouvement respiratoire non- uniforme, une variabilité inter-individuelle et contiennent un échantillonnage de lésions de taille et de contraste variable. Ce cahier des charges nous a orientés vers les méthodes de simulation Monte Carlo qui permettent de contrôler l’ensemble des paramètres influençant la formation et la qualité de l’image. Une base de 15 modèles de patient a été créée en adaptant le modèle anthropomorphique XCAT sur des images tomodensitométriques (TDM) de patients. Nous avons en parallèle développé une stratégie originale d’évaluation des performances de détection. Cette méthode comprend un système de détection des lésions automatisé basé sur l’utilisation de machines à vecteurs de support (SVM) utilisant des caractéristiques fréquentielles. Les performances sont mesurées par l’analyse psychophysique des courbes free-receiver operating characteristics (FROC) que nous avons adaptée aux spécificités de l’imagerie TEP.

L’évaluation des performances est réalisée sur deux techniques de correction du mouvement respiratoire, en les comparant avec les performances obtenues sur des images non corrigées ainsi que sur des images sans mouvement respiratoire.

Les résultats obtenus sont prometteurs et montrent une réelle amélioration de la détection des lésions après correction, qui approche les performances obtenues sur les images statiques.

## Jury

Président, Christophe Odet, Professeur, CREATIS, INSA-lyon
Rapporteur, Michel Desvignes, Professeur, GIPSA-Lab, INP Grenoble
Rapporteur, Su Ruan, Professeur, LITIS, Université ́de Rouen
Examinateur, Frédéric Lamare, Docteur, Ingénieur de Recherche, INCIA
Examinateur, Jean-Michel Rouet, Docteur, Ingénieur Philips Healthcare Medisy
Co-encadrante, Carole Lartizien, chargée de Recherche CNRS, CREATIS, Lyon
Directeur de thèse, Rémy Prost, Professeur, CREATIS, INSA-Lyon




