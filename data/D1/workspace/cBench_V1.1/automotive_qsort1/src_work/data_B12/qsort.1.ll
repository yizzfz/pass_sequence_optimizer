; ModuleID = 'qsort.ll'
source_filename = "qsort.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define void @qsortx(i8*, i32, i32, i32 (i8*, i8*)* nocapture) local_unnamed_addr #0 {
  %5 = alloca [30 x i8*], align 16
  %6 = alloca [30 x i8*], align 16
  %7 = icmp ult i32 %1, 2
  %8 = icmp eq i32 %2, 0
  %or.cond = or i1 %7, %8
  br i1 %or.cond, label %.loopexit, label %9

; <label>:9:                                      ; preds = %4
  %10 = add i32 %1, -1
  %11 = mul i32 %10, %2
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds i8, i8* %0, i64 %12
  %14 = zext i32 %2 to i64
  %15 = sub nsw i64 0, %14
  br label %.outer

.outer:                                           ; preds = %.outer.backedge, %9
  %.06.ph = phi i8* [ %0, %9 ], [ %.06.ph.be, %.outer.backedge ]
  %.05.ph = phi i8* [ %13, %9 ], [ %.05.ph.be, %.outer.backedge ]
  %.0.ph = phi i32 [ 0, %9 ], [ %.0.ph.be, %.outer.backedge ]
  %16 = ptrtoint i8* %.05.ph to i64
  %17 = ptrtoint i8* %.06.ph to i64
  %18 = sub i64 %16, %17
  %19 = sdiv i64 %18, %14
  %20 = add nsw i64 %19, 1
  %21 = trunc i64 %20 to i32
  %22 = icmp ult i32 %21, 9
  br i1 %22, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.outer
  %23 = getelementptr inbounds i8, i8* %.06.ph, i64 %14
  br label %24

._crit_edge.loopexit:                             ; preds = %73
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.outer
  %.05.lcssa = phi i8* [ %.05.ph, %.outer ], [ %74, %._crit_edge.loopexit ]
  %.0.lcssa = phi i32 [ %.0.ph, %.outer ], [ %.2, %._crit_edge.loopexit ]
  tail call fastcc void @shortsort(i8* %.06.ph, i8* %.05.lcssa, i32 %2, i32 (i8*, i8*)* %3)
  br label %.loopexit8

; <label>:24:                                     ; preds = %.lr.ph, %73
  %25 = phi i32 [ %21, %.lr.ph ], [ %79, %73 ]
  %26 = phi i64 [ %16, %.lr.ph ], [ %75, %73 ]
  %.022 = phi i32 [ %.0.ph, %.lr.ph ], [ %.2, %73 ]
  %.0521 = phi i8* [ %.05.ph, %.lr.ph ], [ %74, %73 ]
  %27 = lshr i32 %25, 1
  %28 = mul i32 %27, %2
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i8, i8* %.06.ph, i64 %29
  tail call fastcc void @swap(i8* %30, i8* %.06.ph, i32 %2)
  %31 = getelementptr inbounds i8, i8* %.0521, i64 %14
  br label %32

; <label>:32:                                     ; preds = %45, %24
  %.03 = phi i8* [ %.06.ph, %24 ], [ %34, %45 ]
  %.01 = phi i8* [ %31, %24 ], [ %39, %45 ]
  br label %33

; <label>:33:                                     ; preds = %36, %32
  %.14 = phi i8* [ %.03, %32 ], [ %34, %36 ]
  %34 = getelementptr inbounds i8, i8* %.14, i64 %14
  %35 = icmp ugt i8* %34, %.0521
  br i1 %35, label %.critedge.preheader, label %36

; <label>:36:                                     ; preds = %33
  %37 = tail call i32 %3(i8* %34, i8* %.06.ph) #2
  %38 = icmp slt i32 %37, 1
  br i1 %38, label %33, label %.critedge.preheader

.critedge.preheader:                              ; preds = %36, %33
  br label %.critedge

.critedge:                                        ; preds = %.critedge.preheader, %41
  %.12 = phi i8* [ %39, %41 ], [ %.01, %.critedge.preheader ]
  %39 = getelementptr inbounds i8, i8* %.12, i64 %15
  %40 = icmp ugt i8* %39, %.06.ph
  br i1 %40, label %41, label %.critedge7

; <label>:41:                                     ; preds = %.critedge
  %42 = tail call i32 %3(i8* %39, i8* %.06.ph) #2
  %43 = icmp sgt i32 %42, -1
  br i1 %43, label %.critedge, label %.critedge7

.critedge7:                                       ; preds = %.critedge, %41
  %44 = icmp ult i8* %39, %34
  br i1 %44, label %46, label %45

; <label>:45:                                     ; preds = %.critedge7
  tail call fastcc void @swap(i8* %34, i8* %39, i32 %2)
  br label %32

; <label>:46:                                     ; preds = %.critedge7
  tail call fastcc void @swap(i8* %.06.ph, i8* %39, i32 %2)
  %47 = getelementptr inbounds i8, i8* %39, i64 -1
  %48 = ptrtoint i8* %47 to i64
  %49 = sub i64 %48, %17
  %50 = ptrtoint i8* %34 to i64
  %51 = sub i64 %26, %50
  %52 = icmp slt i64 %49, %51
  br i1 %52, label %64, label %53

; <label>:53:                                     ; preds = %46
  %54 = getelementptr inbounds i8, i8* %.06.ph, i64 %14
  %55 = icmp ult i8* %54, %39
  %56 = sext i32 %.022 to i64
  br i1 %55, label %57, label %62

; <label>:57:                                     ; preds = %53
  %58 = add nsw i32 %.022, 1
  %59 = getelementptr inbounds [30 x i8*], [30 x i8*]* %6, i64 0, i64 %56
  %60 = getelementptr inbounds i8, i8* %39, i64 %15
  %61 = getelementptr inbounds [30 x i8*], [30 x i8*]* %5, i64 0, i64 %56
  store i8* %.06.ph, i8** %61, align 8
  store i8* %60, i8** %59, align 8
  br label %62

; <label>:62:                                     ; preds = %57, %53
  %.1 = phi i32 [ %58, %57 ], [ %.022, %53 ]
  %63 = icmp ult i8* %34, %.0521
  br i1 %63, label %.outer.backedge, label %.loopexit8

; <label>:64:                                     ; preds = %46
  %65 = icmp ult i8* %34, %.0521
  %66 = sext i32 %.022 to i64
  br i1 %65, label %67, label %71

; <label>:67:                                     ; preds = %64
  %68 = add nsw i32 %.022, 1
  %69 = getelementptr inbounds [30 x i8*], [30 x i8*]* %6, i64 0, i64 %66
  %70 = getelementptr inbounds [30 x i8*], [30 x i8*]* %5, i64 0, i64 %66
  store i8* %34, i8** %70, align 8
  store i8* %.0521, i8** %69, align 8
  br label %71

; <label>:71:                                     ; preds = %67, %64
  %.2 = phi i32 [ %68, %67 ], [ %.022, %64 ]
  %72 = icmp ult i8* %23, %39
  br i1 %72, label %73, label %.loopexit8.loopexit

; <label>:73:                                     ; preds = %71
  %74 = getelementptr inbounds i8, i8* %39, i64 %15
  %75 = ptrtoint i8* %74 to i64
  %76 = sub i64 %75, %17
  %77 = sdiv i64 %76, %14
  %78 = add nsw i64 %77, 1
  %79 = trunc i64 %78 to i32
  %80 = icmp ult i32 %79, 9
  br i1 %80, label %._crit_edge.loopexit, label %24

.loopexit8.loopexit:                              ; preds = %71
  br label %.loopexit8

.loopexit8:                                       ; preds = %.loopexit8.loopexit, %62, %._crit_edge
  %.4 = phi i32 [ %.0.lcssa, %._crit_edge ], [ %.1, %62 ], [ %.2, %.loopexit8.loopexit ]
  %81 = add nsw i32 %.4, -1
  %82 = icmp sgt i32 %.4, 0
  br i1 %82, label %83, label %.loopexit.loopexit

; <label>:83:                                     ; preds = %.loopexit8
  %84 = sext i32 %81 to i64
  %85 = getelementptr inbounds [30 x i8*], [30 x i8*]* %5, i64 0, i64 %84
  %86 = load i8*, i8** %85, align 8
  %87 = getelementptr inbounds [30 x i8*], [30 x i8*]* %6, i64 0, i64 %84
  %88 = load i8*, i8** %87, align 8
  br label %.outer.backedge

.outer.backedge:                                  ; preds = %83, %62
  %.06.ph.be = phi i8* [ %34, %62 ], [ %86, %83 ]
  %.05.ph.be = phi i8* [ %.0521, %62 ], [ %88, %83 ]
  %.0.ph.be = phi i32 [ %.1, %62 ], [ %81, %83 ]
  br label %.outer

.loopexit.loopexit:                               ; preds = %.loopexit8
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @shortsort(i8*, i8*, i32, i32 (i8*, i8*)* nocapture) unnamed_addr #0 {
  %5 = icmp ugt i8* %1, %0
  br i1 %5, label %.preheader.lr.ph, label %._crit_edge6

.preheader.lr.ph:                                 ; preds = %4
  %6 = zext i32 %2 to i64
  %7 = getelementptr inbounds i8, i8* %0, i64 %6
  %8 = sub nsw i64 0, %6
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge
  %.015 = phi i8* [ %1, %.preheader.lr.ph ], [ %15, %._crit_edge ]
  %9 = icmp ugt i8* %7, %.015
  br i1 %9, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %10 = phi i8* [ %13, %.lr.ph ], [ %7, %.lr.ph.preheader ]
  %.03 = phi i8* [ %..0, %.lr.ph ], [ %0, %.lr.ph.preheader ]
  %11 = tail call i32 %3(i8* %10, i8* %.03) #2
  %12 = icmp sgt i32 %11, 0
  %..0 = select i1 %12, i8* %10, i8* %.03
  %13 = getelementptr inbounds i8, i8* %10, i64 %6
  %14 = icmp ugt i8* %13, %.015
  br i1 %14, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.0.lcssa = phi i8* [ %0, %.preheader ], [ %..0, %._crit_edge.loopexit ]
  tail call fastcc void @swap(i8* %.0.lcssa, i8* %.015, i32 %2)
  %15 = getelementptr inbounds i8, i8* %.015, i64 %8
  %16 = icmp ugt i8* %15, %0
  br i1 %16, label %.preheader, label %._crit_edge6.loopexit

._crit_edge6.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @swap(i8*, i8*, i32) unnamed_addr #1 {
  %4 = icmp eq i8* %0, %1
  %5 = icmp eq i32 %2, 0
  %or.cond = or i1 %4, %5
  br i1 %or.cond, label %.loopexit, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %3
  %6 = add i32 %2, -1
  %xtraiter = and i32 %2, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.05.prol = phi i8* [ %10, %.lr.ph.prol ], [ %0, %.lr.ph.prol.preheader ]
  %.014.prol = phi i8* [ %11, %.lr.ph.prol ], [ %1, %.lr.ph.prol.preheader ]
  %.023.prol = phi i32 [ %7, %.lr.ph.prol ], [ %2, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %7 = add i32 %.023.prol, -1
  %8 = load i8, i8* %.05.prol, align 1
  %9 = load i8, i8* %.014.prol, align 1
  %10 = getelementptr inbounds i8, i8* %.05.prol, i64 1
  store i8 %9, i8* %.05.prol, align 1
  %11 = getelementptr inbounds i8, i8* %.014.prol, i64 1
  store i8 %8, i8* %.014.prol, align 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !1

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.05.unr = phi i8* [ %0, %.lr.ph.preheader ], [ %10, %.lr.ph.prol.loopexit.loopexit ]
  %.014.unr = phi i8* [ %1, %.lr.ph.preheader ], [ %11, %.lr.ph.prol.loopexit.loopexit ]
  %.023.unr = phi i32 [ %2, %.lr.ph.preheader ], [ %7, %.lr.ph.prol.loopexit.loopexit ]
  %12 = icmp ult i32 %6, 3
  br i1 %12, label %.loopexit, label %.lr.ph.preheader12

.lr.ph.preheader12:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader12, %.lr.ph
  %.05 = phi i8* [ %28, %.lr.ph ], [ %.05.unr, %.lr.ph.preheader12 ]
  %.014 = phi i8* [ %29, %.lr.ph ], [ %.014.unr, %.lr.ph.preheader12 ]
  %.023 = phi i32 [ %25, %.lr.ph ], [ %.023.unr, %.lr.ph.preheader12 ]
  %13 = load i8, i8* %.05, align 1
  %14 = load i8, i8* %.014, align 1
  %15 = getelementptr inbounds i8, i8* %.05, i64 1
  store i8 %14, i8* %.05, align 1
  %16 = getelementptr inbounds i8, i8* %.014, i64 1
  store i8 %13, i8* %.014, align 1
  %17 = load i8, i8* %15, align 1
  %18 = load i8, i8* %16, align 1
  %19 = getelementptr inbounds i8, i8* %.05, i64 2
  store i8 %18, i8* %15, align 1
  %20 = getelementptr inbounds i8, i8* %.014, i64 2
  store i8 %17, i8* %16, align 1
  %21 = load i8, i8* %19, align 1
  %22 = load i8, i8* %20, align 1
  %23 = getelementptr inbounds i8, i8* %.05, i64 3
  store i8 %22, i8* %19, align 1
  %24 = getelementptr inbounds i8, i8* %.014, i64 3
  store i8 %21, i8* %20, align 1
  %25 = add i32 %.023, -4
  %26 = load i8, i8* %23, align 1
  %27 = load i8, i8* %24, align 1
  %28 = getelementptr inbounds i8, i8* %.05, i64 4
  store i8 %27, i8* %23, align 1
  %29 = getelementptr inbounds i8, i8* %.014, i64 4
  store i8 %26, i8* %24, align 1
  %30 = icmp eq i32 %25, 0
  br i1 %30, label %.loopexit.loopexit, label %.lr.ph

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.lr.ph.prol.loopexit, %3
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
