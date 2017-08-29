; ModuleID = 'tif_swab.ll'
source_filename = "tif_swab.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@TIFFBitRevTable = internal constant [256 x i8] c"\00\80@\C0 \A0`\E0\10\90P\D00\B0p\F0\08\88H\C8(\A8h\E8\18\98X\D88\B8x\F8\04\84D\C4$\A4d\E4\14\94T\D44\B4t\F4\0C\8CL\CC,\ACl\EC\1C\9C\5C\DC<\BC|\FC\02\82B\C2\22\A2b\E2\12\92R\D22\B2r\F2\0A\8AJ\CA*\AAj\EA\1A\9AZ\DA:\BAz\FA\06\86F\C6&\A6f\E6\16\96V\D66\B6v\F6\0E\8EN\CE.\AEn\EE\1E\9E^\DE>\BE~\FE\01\81A\C1!\A1a\E1\11\91Q\D11\B1q\F1\09\89I\C9)\A9i\E9\19\99Y\D99\B9y\F9\05\85E\C5%\A5e\E5\15\95U\D55\B5u\F5\0D\8DM\CD-\ADm\ED\1D\9D]\DD=\BD}\FD\03\83C\C3#\A3c\E3\13\93S\D33\B3s\F3\0B\8BK\CB+\ABk\EB\1B\9B[\DB;\BB{\FB\07\87G\C7'\A7g\E7\17\97W\D77\B7w\F7\0F\8FO\CF/\AFo\EF\1F\9F_\DF?\BF\7F\FF", align 16
@TIFFNoBitRevTable = internal constant [256 x i8] c"\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\10\11\12\13\14\15\16\17\18\19\1A\1B\1C\1D\1E\1F !\22#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\5C]^_`abcdefghijklmnopqrstuvwxyz{|}~\7F\80\81\82\83\84\85\86\87\88\89\8A\8B\8C\8D\8E\8F\90\91\92\93\94\95\96\97\98\99\9A\9B\9C\9D\9E\9F\A0\A1\A2\A3\A4\A5\A6\A7\A8\A9\AA\AB\AC\AD\AE\AF\B0\B1\B2\B3\B4\B5\B6\B7\B8\B9\BA\BB\BC\BD\BE\BF\C0\C1\C2\C3\C4\C5\C6\C7\C8\C9\CA\CB\CC\CD\CE\CF\D0\D1\D2\D3\D4\D5\D6\D7\D8\D9\DA\DB\DC\DD\DE\DF\E0\E1\E2\E3\E4\E5\E6\E7\E8\E9\EA\EB\EC\ED\EE\EF\F0\F1\F2\F3\F4\F5\F6\F7\F8\F9\FA\FB\FC\FD\FE\FF", align 16

; Function Attrs: noinline norecurse nounwind uwtable
define void @TIFFSwabShort(i16* nocapture) local_unnamed_addr #0 {
  %2 = bitcast i16* %0 to i8*
  %3 = getelementptr inbounds i8, i8* %2, i64 1
  %4 = load i8, i8* %3, align 1
  %5 = load i8, i8* %2, align 1
  store i8 %5, i8* %3, align 1
  store i8 %4, i8* %2, align 1
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @TIFFSwabLong(i32* nocapture) local_unnamed_addr #0 {
  %2 = bitcast i32* %0 to i8*
  %3 = getelementptr inbounds i8, i8* %2, i64 3
  %4 = load i8, i8* %3, align 1
  %5 = load i8, i8* %2, align 1
  store i8 %5, i8* %3, align 1
  store i8 %4, i8* %2, align 1
  %6 = getelementptr inbounds i8, i8* %2, i64 2
  %7 = load i8, i8* %6, align 1
  %8 = getelementptr inbounds i8, i8* %2, i64 1
  %9 = load i8, i8* %8, align 1
  store i8 %9, i8* %6, align 1
  store i8 %7, i8* %8, align 1
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @TIFFSwabArrayOfShort(i16* nocapture, i64) local_unnamed_addr #0 {
  %3 = icmp eq i64 %1, 0
  br i1 %3, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %2
  %4 = add i64 %1, -1
  %xtraiter = and i64 %1, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.03.prol = phi i16* [ %10, %.lr.ph.prol ], [ %0, %.lr.ph.prol.preheader ]
  %.012.prol = phi i64 [ %5, %.lr.ph.prol ], [ %1, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %5 = add i64 %.012.prol, -1
  %6 = bitcast i16* %.03.prol to i8*
  %7 = getelementptr inbounds i8, i8* %6, i64 1
  %8 = load i8, i8* %7, align 1
  %9 = load i8, i8* %6, align 1
  store i8 %9, i8* %7, align 1
  store i8 %8, i8* %6, align 1
  %10 = getelementptr inbounds i16, i16* %.03.prol, i64 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !1

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.03.unr = phi i16* [ %0, %.lr.ph.preheader ], [ %10, %.lr.ph.prol.loopexit.loopexit ]
  %.012.unr = phi i64 [ %1, %.lr.ph.preheader ], [ %5, %.lr.ph.prol.loopexit.loopexit ]
  %11 = icmp ult i64 %4, 3
  br i1 %11, label %._crit_edge, label %.lr.ph.preheader8

.lr.ph.preheader8:                                ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader8, %.lr.ph
  %.03 = phi i16* [ %32, %.lr.ph ], [ %.03.unr, %.lr.ph.preheader8 ]
  %.012 = phi i64 [ %27, %.lr.ph ], [ %.012.unr, %.lr.ph.preheader8 ]
  %12 = bitcast i16* %.03 to i8*
  %13 = getelementptr inbounds i8, i8* %12, i64 1
  %14 = load i8, i8* %13, align 1
  %15 = load i8, i8* %12, align 1
  store i8 %15, i8* %13, align 1
  store i8 %14, i8* %12, align 1
  %16 = getelementptr inbounds i16, i16* %.03, i64 1
  %17 = bitcast i16* %16 to i8*
  %18 = getelementptr inbounds i8, i8* %17, i64 1
  %19 = load i8, i8* %18, align 1
  %20 = load i8, i8* %17, align 1
  store i8 %20, i8* %18, align 1
  store i8 %19, i8* %17, align 1
  %21 = getelementptr inbounds i16, i16* %.03, i64 2
  %22 = bitcast i16* %21 to i8*
  %23 = getelementptr inbounds i8, i8* %22, i64 1
  %24 = load i8, i8* %23, align 1
  %25 = load i8, i8* %22, align 1
  store i8 %25, i8* %23, align 1
  store i8 %24, i8* %22, align 1
  %26 = getelementptr inbounds i16, i16* %.03, i64 3
  %27 = add i64 %.012, -4
  %28 = bitcast i16* %26 to i8*
  %29 = getelementptr inbounds i8, i8* %28, i64 1
  %30 = load i8, i8* %29, align 1
  %31 = load i8, i8* %28, align 1
  store i8 %31, i8* %29, align 1
  store i8 %30, i8* %28, align 1
  %32 = getelementptr inbounds i16, i16* %.03, i64 4
  %33 = icmp eq i64 %27, 0
  br i1 %33, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %2
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @TIFFSwabArrayOfLong(i32* nocapture, i64) local_unnamed_addr #0 {
  %3 = icmp eq i64 %1, 0
  br i1 %3, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %2
  %xtraiter = and i64 %1, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %4 = add i64 %1, -1
  %5 = bitcast i32* %0 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 3
  %7 = load i8, i8* %6, align 1
  %8 = load i8, i8* %5, align 1
  store i8 %8, i8* %6, align 1
  store i8 %7, i8* %5, align 1
  %9 = getelementptr inbounds i8, i8* %5, i64 2
  %10 = load i8, i8* %9, align 1
  %11 = getelementptr inbounds i8, i8* %5, i64 1
  %12 = load i8, i8* %11, align 1
  store i8 %12, i8* %9, align 1
  store i8 %10, i8* %11, align 1
  %13 = getelementptr inbounds i32, i32* %0, i64 1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %.03.unr = phi i32* [ %0, %.lr.ph.preheader ], [ %13, %.lr.ph.prol ]
  %.012.unr = phi i64 [ %1, %.lr.ph.preheader ], [ %4, %.lr.ph.prol ]
  %14 = icmp eq i64 %1, 1
  br i1 %14, label %._crit_edge, label %.lr.ph.preheader6

.lr.ph.preheader6:                                ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader6, %.lr.ph
  %.03 = phi i32* [ %33, %.lr.ph ], [ %.03.unr, %.lr.ph.preheader6 ]
  %.012 = phi i64 [ %24, %.lr.ph ], [ %.012.unr, %.lr.ph.preheader6 ]
  %15 = bitcast i32* %.03 to i8*
  %16 = getelementptr inbounds i8, i8* %15, i64 3
  %17 = load i8, i8* %16, align 1
  %18 = load i8, i8* %15, align 1
  store i8 %18, i8* %16, align 1
  store i8 %17, i8* %15, align 1
  %19 = getelementptr inbounds i8, i8* %15, i64 2
  %20 = load i8, i8* %19, align 1
  %21 = getelementptr inbounds i8, i8* %15, i64 1
  %22 = load i8, i8* %21, align 1
  store i8 %22, i8* %19, align 1
  store i8 %20, i8* %21, align 1
  %23 = getelementptr inbounds i32, i32* %.03, i64 1
  %24 = add i64 %.012, -2
  %25 = bitcast i32* %23 to i8*
  %26 = getelementptr inbounds i8, i8* %25, i64 3
  %27 = load i8, i8* %26, align 1
  %28 = load i8, i8* %25, align 1
  store i8 %28, i8* %26, align 1
  store i8 %27, i8* %25, align 1
  %29 = getelementptr inbounds i8, i8* %25, i64 2
  %30 = load i8, i8* %29, align 1
  %31 = getelementptr inbounds i8, i8* %25, i64 1
  %32 = load i8, i8* %31, align 1
  store i8 %32, i8* %29, align 1
  store i8 %30, i8* %31, align 1
  %33 = getelementptr inbounds i32, i32* %.03, i64 2
  %34 = icmp eq i64 %24, 0
  br i1 %34, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %2
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @TIFFSwabDouble(double* nocapture) local_unnamed_addr #0 {
  %2 = bitcast double* %0 to i32*
  tail call void @TIFFSwabArrayOfLong(i32* %2, i64 2)
  %3 = load i32, i32* %2, align 4
  %4 = getelementptr inbounds i32, i32* %2, i64 1
  %5 = load i32, i32* %4, align 4
  store i32 %5, i32* %2, align 4
  store i32 %3, i32* %4, align 4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @TIFFSwabArrayOfDouble(double* nocapture, i64) local_unnamed_addr #0 {
  %3 = bitcast double* %0 to i32*
  %4 = shl i64 %1, 1
  tail call void @TIFFSwabArrayOfLong(i32* %3, i64 %4)
  %5 = icmp eq i64 %1, 0
  br i1 %5, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %2
  %6 = add i64 %1, -1
  %xtraiter = and i64 %1, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.03.prol = phi i32* [ %11, %.lr.ph.prol ], [ %3, %.lr.ph.prol.preheader ]
  %.012.prol = phi i64 [ %7, %.lr.ph.prol ], [ %1, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %7 = add i64 %.012.prol, -1
  %8 = load i32, i32* %.03.prol, align 4
  %9 = getelementptr inbounds i32, i32* %.03.prol, i64 1
  %10 = load i32, i32* %9, align 4
  store i32 %10, i32* %.03.prol, align 4
  store i32 %8, i32* %9, align 4
  %11 = getelementptr inbounds i32, i32* %.03.prol, i64 2
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !3

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.03.unr = phi i32* [ %3, %.lr.ph.preheader ], [ %11, %.lr.ph.prol.loopexit.loopexit ]
  %.012.unr = phi i64 [ %1, %.lr.ph.preheader ], [ %7, %.lr.ph.prol.loopexit.loopexit ]
  %12 = icmp ult i64 %6, 3
  br i1 %12, label %._crit_edge, label %.lr.ph.preheader8

.lr.ph.preheader8:                                ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader8, %.lr.ph
  %.03 = phi i32* [ %29, %.lr.ph ], [ %.03.unr, %.lr.ph.preheader8 ]
  %.012 = phi i64 [ %25, %.lr.ph ], [ %.012.unr, %.lr.ph.preheader8 ]
  %13 = load i32, i32* %.03, align 4
  %14 = getelementptr inbounds i32, i32* %.03, i64 1
  %15 = load i32, i32* %14, align 4
  store i32 %15, i32* %.03, align 4
  store i32 %13, i32* %14, align 4
  %16 = getelementptr inbounds i32, i32* %.03, i64 2
  %17 = load i32, i32* %16, align 4
  %18 = getelementptr inbounds i32, i32* %.03, i64 3
  %19 = load i32, i32* %18, align 4
  store i32 %19, i32* %16, align 4
  store i32 %17, i32* %18, align 4
  %20 = getelementptr inbounds i32, i32* %.03, i64 4
  %21 = load i32, i32* %20, align 4
  %22 = getelementptr inbounds i32, i32* %.03, i64 5
  %23 = load i32, i32* %22, align 4
  store i32 %23, i32* %20, align 4
  store i32 %21, i32* %22, align 4
  %24 = getelementptr inbounds i32, i32* %.03, i64 6
  %25 = add i64 %.012, -4
  %26 = load i32, i32* %24, align 4
  %27 = getelementptr inbounds i32, i32* %.03, i64 7
  %28 = load i32, i32* %27, align 4
  store i32 %28, i32* %24, align 4
  store i32 %26, i32* %27, align 4
  %29 = getelementptr inbounds i32, i32* %.03, i64 8
  %30 = icmp eq i64 %25, 0
  br i1 %30, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %2
  ret void
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define i8* @TIFFGetBitRevTable(i32) local_unnamed_addr #1 {
  %2 = icmp ne i32 %0, 0
  %3 = select i1 %2, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @TIFFBitRevTable, i64 0, i64 0), i8* getelementptr inbounds ([256 x i8], [256 x i8]* @TIFFNoBitRevTable, i64 0, i64 0)
  ret i8* %3
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @TIFFReverseBits(i8* nocapture, i64) local_unnamed_addr #0 {
  %3 = icmp ugt i64 %1, 8
  br i1 %3, label %.lr.ph8.preheader, label %.preheader

.lr.ph8.preheader:                                ; preds = %2
  %4 = add i64 %1, -9
  %5 = and i64 %4, -8
  %6 = add i64 %5, 8
  %7 = add i64 %1, -8
  br label %.lr.ph8

.preheader.loopexit:                              ; preds = %.lr.ph8
  %scevgep = getelementptr i8, i8* %0, i64 %6
  %8 = sub i64 %7, %5
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %2
  %.01.lcssa = phi i64 [ %1, %2 ], [ %8, %.preheader.loopexit ]
  %.0.lcssa = phi i8* [ %0, %2 ], [ %scevgep, %.preheader.loopexit ]
  %9 = icmp eq i64 %.01.lcssa, 0
  br i1 %9, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  %10 = add i64 %.01.lcssa, -1
  %xtraiter = and i64 %.01.lcssa, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.14.prol = phi i8* [ %16, %.lr.ph.prol ], [ %.0.lcssa, %.lr.ph.prol.preheader ]
  %.123.prol = phi i64 [ %11, %.lr.ph.prol ], [ %.01.lcssa, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %11 = add i64 %.123.prol, -1
  %12 = load i8, i8* %.14.prol, align 1
  %13 = zext i8 %12 to i64
  %14 = getelementptr inbounds [256 x i8], [256 x i8]* @TIFFBitRevTable, i64 0, i64 %13
  %15 = load i8, i8* %14, align 1
  store i8 %15, i8* %.14.prol, align 1
  %16 = getelementptr inbounds i8, i8* %.14.prol, i64 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !4

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.14.unr = phi i8* [ %.0.lcssa, %.lr.ph.preheader ], [ %16, %.lr.ph.prol.loopexit.loopexit ]
  %.123.unr = phi i64 [ %.01.lcssa, %.lr.ph.preheader ], [ %11, %.lr.ph.prol.loopexit.loopexit ]
  %17 = icmp ult i64 %10, 3
  br i1 %17, label %._crit_edge, label %.lr.ph.preheader15

.lr.ph.preheader15:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph8:                                          ; preds = %.lr.ph8.preheader, %.lr.ph8
  %.06 = phi i8* [ %57, %.lr.ph8 ], [ %0, %.lr.ph8.preheader ]
  %.015 = phi i64 [ %58, %.lr.ph8 ], [ %1, %.lr.ph8.preheader ]
  %18 = load i8, i8* %.06, align 1
  %19 = zext i8 %18 to i64
  %20 = getelementptr inbounds [256 x i8], [256 x i8]* @TIFFBitRevTable, i64 0, i64 %19
  %21 = load i8, i8* %20, align 1
  store i8 %21, i8* %.06, align 1
  %22 = getelementptr inbounds i8, i8* %.06, i64 1
  %23 = load i8, i8* %22, align 1
  %24 = zext i8 %23 to i64
  %25 = getelementptr inbounds [256 x i8], [256 x i8]* @TIFFBitRevTable, i64 0, i64 %24
  %26 = load i8, i8* %25, align 1
  store i8 %26, i8* %22, align 1
  %27 = getelementptr inbounds i8, i8* %.06, i64 2
  %28 = load i8, i8* %27, align 1
  %29 = zext i8 %28 to i64
  %30 = getelementptr inbounds [256 x i8], [256 x i8]* @TIFFBitRevTable, i64 0, i64 %29
  %31 = load i8, i8* %30, align 1
  store i8 %31, i8* %27, align 1
  %32 = getelementptr inbounds i8, i8* %.06, i64 3
  %33 = load i8, i8* %32, align 1
  %34 = zext i8 %33 to i64
  %35 = getelementptr inbounds [256 x i8], [256 x i8]* @TIFFBitRevTable, i64 0, i64 %34
  %36 = load i8, i8* %35, align 1
  store i8 %36, i8* %32, align 1
  %37 = getelementptr inbounds i8, i8* %.06, i64 4
  %38 = load i8, i8* %37, align 1
  %39 = zext i8 %38 to i64
  %40 = getelementptr inbounds [256 x i8], [256 x i8]* @TIFFBitRevTable, i64 0, i64 %39
  %41 = load i8, i8* %40, align 1
  store i8 %41, i8* %37, align 1
  %42 = getelementptr inbounds i8, i8* %.06, i64 5
  %43 = load i8, i8* %42, align 1
  %44 = zext i8 %43 to i64
  %45 = getelementptr inbounds [256 x i8], [256 x i8]* @TIFFBitRevTable, i64 0, i64 %44
  %46 = load i8, i8* %45, align 1
  store i8 %46, i8* %42, align 1
  %47 = getelementptr inbounds i8, i8* %.06, i64 6
  %48 = load i8, i8* %47, align 1
  %49 = zext i8 %48 to i64
  %50 = getelementptr inbounds [256 x i8], [256 x i8]* @TIFFBitRevTable, i64 0, i64 %49
  %51 = load i8, i8* %50, align 1
  store i8 %51, i8* %47, align 1
  %52 = getelementptr inbounds i8, i8* %.06, i64 7
  %53 = load i8, i8* %52, align 1
  %54 = zext i8 %53 to i64
  %55 = getelementptr inbounds [256 x i8], [256 x i8]* @TIFFBitRevTable, i64 0, i64 %54
  %56 = load i8, i8* %55, align 1
  store i8 %56, i8* %52, align 1
  %57 = getelementptr inbounds i8, i8* %.06, i64 8
  %58 = add i64 %.015, -8
  %59 = icmp ugt i64 %58, 8
  br i1 %59, label %.lr.ph8, label %.preheader.loopexit

.lr.ph:                                           ; preds = %.lr.ph.preheader15, %.lr.ph
  %.14 = phi i8* [ %80, %.lr.ph ], [ %.14.unr, %.lr.ph.preheader15 ]
  %.123 = phi i64 [ %75, %.lr.ph ], [ %.123.unr, %.lr.ph.preheader15 ]
  %60 = load i8, i8* %.14, align 1
  %61 = zext i8 %60 to i64
  %62 = getelementptr inbounds [256 x i8], [256 x i8]* @TIFFBitRevTable, i64 0, i64 %61
  %63 = load i8, i8* %62, align 1
  store i8 %63, i8* %.14, align 1
  %64 = getelementptr inbounds i8, i8* %.14, i64 1
  %65 = load i8, i8* %64, align 1
  %66 = zext i8 %65 to i64
  %67 = getelementptr inbounds [256 x i8], [256 x i8]* @TIFFBitRevTable, i64 0, i64 %66
  %68 = load i8, i8* %67, align 1
  store i8 %68, i8* %64, align 1
  %69 = getelementptr inbounds i8, i8* %.14, i64 2
  %70 = load i8, i8* %69, align 1
  %71 = zext i8 %70 to i64
  %72 = getelementptr inbounds [256 x i8], [256 x i8]* @TIFFBitRevTable, i64 0, i64 %71
  %73 = load i8, i8* %72, align 1
  store i8 %73, i8* %69, align 1
  %74 = getelementptr inbounds i8, i8* %.14, i64 3
  %75 = add i64 %.123, -4
  %76 = load i8, i8* %74, align 1
  %77 = zext i8 %76 to i64
  %78 = getelementptr inbounds [256 x i8], [256 x i8]* @TIFFBitRevTable, i64 0, i64 %77
  %79 = load i8, i8* %78, align 1
  store i8 %79, i8* %74, align 1
  %80 = getelementptr inbounds i8, i8* %.14, i64 4
  %81 = icmp eq i64 %75, 0
  br i1 %81, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.preheader
  ret void
}

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
