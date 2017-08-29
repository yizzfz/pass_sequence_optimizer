; ModuleID = 'patricia.ll'
source_filename = "patricia.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ptree = type { i64, %struct.ptree_mask*, i8, i8, %struct.ptree*, %struct.ptree* }
%struct.ptree_mask = type { i64, i8* }

; Function Attrs: noinline nounwind uwtable
define %struct.ptree* @pat_insert(%struct.ptree*, %struct.ptree*) local_unnamed_addr #0 {
  %3 = icmp eq %struct.ptree* %1, null
  %4 = icmp eq %struct.ptree* %0, null
  %or.cond = or i1 %4, %3
  br i1 %or.cond, label %121, label %5

; <label>:5:                                      ; preds = %2
  %6 = getelementptr inbounds %struct.ptree, %struct.ptree* %0, i64 0, i32 1
  %7 = load %struct.ptree_mask*, %struct.ptree_mask** %6, align 8
  %8 = icmp eq %struct.ptree_mask* %7, null
  br i1 %8, label %121, label %9

; <label>:9:                                      ; preds = %5
  %10 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %7, i64 0, i32 0
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds %struct.ptree, %struct.ptree* %0, i64 0, i32 0
  %13 = load i64, i64* %12, align 8
  %14 = and i64 %13, %11
  store i64 %14, i64* %12, align 8
  br label %15

; <label>:15:                                     ; preds = %15, %9
  %.02 = phi %struct.ptree* [ %1, %9 ], [ %23, %15 ]
  %16 = getelementptr inbounds %struct.ptree, %struct.ptree* %.02, i64 0, i32 3
  %17 = load i8, i8* %16, align 1
  %18 = sext i8 %17 to i32
  %19 = tail call fastcc i64 @bit(i32 %18, i64 %14)
  %20 = icmp eq i64 %19, 0
  %21 = getelementptr inbounds %struct.ptree, %struct.ptree* %.02, i64 0, i32 5
  %22 = getelementptr inbounds %struct.ptree, %struct.ptree* %.02, i64 0, i32 4
  %.in = select i1 %20, %struct.ptree** %22, %struct.ptree** %21
  %23 = load %struct.ptree*, %struct.ptree** %.in, align 8
  %24 = getelementptr inbounds %struct.ptree, %struct.ptree* %23, i64 0, i32 3
  %25 = load i8, i8* %24, align 1
  %26 = icmp slt i8 %17, %25
  br i1 %26, label %15, label %27

; <label>:27:                                     ; preds = %15
  %28 = getelementptr inbounds %struct.ptree, %struct.ptree* %23, i64 0, i32 0
  %29 = load i64, i64* %28, align 8
  %30 = icmp eq i64 %14, %29
  br i1 %30, label %.preheader, label %.preheader6

.preheader6:                                      ; preds = %27
  %31 = load i64, i64* %12, align 8
  %32 = load i64, i64* %28, align 8
  br label %100

.preheader:                                       ; preds = %27
  %33 = getelementptr inbounds %struct.ptree, %struct.ptree* %23, i64 0, i32 2
  %34 = load i8, i8* %33, align 8
  %35 = icmp eq i8 %34, 0
  br i1 %35, label %._crit_edge21, label %.lr.ph20

.lr.ph20:                                         ; preds = %.preheader
  %36 = load %struct.ptree_mask*, %struct.ptree_mask** %6, align 8
  %37 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %36, i64 0, i32 0
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds %struct.ptree, %struct.ptree* %23, i64 0, i32 1
  %40 = load %struct.ptree_mask*, %struct.ptree_mask** %39, align 8
  br label %45

; <label>:41:                                     ; preds = %45
  %42 = load i8, i8* %33, align 8
  %43 = zext i8 %42 to i64
  %44 = icmp slt i64 %indvars.iv.next, %43
  br i1 %44, label %45, label %._crit_edge21.loopexit

; <label>:45:                                     ; preds = %.lr.ph20, %41
  %indvars.iv = phi i64 [ 0, %.lr.ph20 ], [ %indvars.iv.next, %41 ]
  %46 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %40, i64 %indvars.iv, i32 0
  %47 = load i64, i64* %46, align 8
  %48 = icmp eq i64 %38, %47
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  br i1 %48, label %49, label %41

; <label>:49:                                     ; preds = %45
  %50 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %36, i64 0, i32 1
  %51 = bitcast i8** %50 to i64*
  %52 = load i64, i64* %51, align 8
  %53 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %40, i64 %indvars.iv, i32 1
  %54 = bitcast i8** %53 to i64*
  store i64 %52, i64* %54, align 8
  %55 = bitcast %struct.ptree_mask** %6 to i8**
  %56 = load i8*, i8** %55, align 8
  tail call void @free(i8* %56) #5
  %57 = bitcast %struct.ptree* %0 to i8*
  tail call void @free(i8* %57) #5
  br label %121

._crit_edge21.loopexit:                           ; preds = %41
  %phitmp = zext i8 %42 to i64
  %phitmp36 = shl nuw nsw i64 %phitmp, 4
  %phitmp37 = add nuw nsw i64 %phitmp36, 16
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %.preheader
  %.lcssa9 = phi i64 [ 16, %.preheader ], [ %phitmp37, %._crit_edge21.loopexit ]
  %58 = tail call noalias i8* @malloc(i64 %.lcssa9) #5
  %59 = bitcast i8* %58 to %struct.ptree_mask*
  %60 = load i8, i8* %33, align 8
  %61 = icmp eq i8 %60, 0
  br i1 %61, label %._crit_edge.thread, label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge21
  %62 = getelementptr inbounds %struct.ptree, %struct.ptree* %23, i64 0, i32 1
  %63 = bitcast %struct.ptree_mask** %6 to i8**
  br label %64

; <label>:64:                                     ; preds = %.lr.ph, %82
  %.0117 = phi i32 [ 0, %.lr.ph ], [ %.1, %82 ]
  %.1416 = phi i32 [ 0, %.lr.ph ], [ %.2, %82 ]
  %.0515 = phi %struct.ptree_mask* [ %59, %.lr.ph ], [ %83, %82 ]
  %65 = load %struct.ptree_mask*, %struct.ptree_mask** %6, align 8
  %66 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %65, i64 0, i32 0
  %67 = load i64, i64* %66, align 8
  %68 = load %struct.ptree_mask*, %struct.ptree_mask** %62, align 8
  %69 = sext i32 %.1416 to i64
  %70 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %68, i64 %69, i32 0
  %71 = load i64, i64* %70, align 8
  %72 = icmp ugt i64 %67, %71
  %73 = bitcast %struct.ptree_mask* %.0515 to i8*
  br i1 %72, label %74, label %78

; <label>:74:                                     ; preds = %64
  %75 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %68, i64 %69
  %76 = bitcast %struct.ptree_mask* %75 to i8*
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* %73, i8* %76, i64 16, i32 8, i1 false)
  %77 = add nsw i32 %.1416, 1
  br label %82

; <label>:78:                                     ; preds = %64
  %79 = load i8*, i8** %63, align 8
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* %73, i8* %79, i64 16, i32 8, i1 false)
  %80 = load %struct.ptree_mask*, %struct.ptree_mask** %6, align 8
  %81 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %80, i64 0, i32 0
  store i64 4294967295, i64* %81, align 8
  br label %82

; <label>:82:                                     ; preds = %74, %78
  %.2 = phi i32 [ %77, %74 ], [ %.1416, %78 ]
  %.1 = phi i32 [ %.0117, %74 ], [ 1, %78 ]
  %83 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %.0515, i64 1
  %84 = load i8, i8* %33, align 8
  %85 = zext i8 %84 to i32
  %86 = icmp slt i32 %.2, %85
  br i1 %86, label %64, label %._crit_edge

._crit_edge:                                      ; preds = %82
  %87 = icmp eq i32 %.1, 0
  br i1 %87, label %._crit_edge.thread, label %91

._crit_edge.thread:                               ; preds = %._crit_edge21, %._crit_edge
  %.05.lcssa29 = phi %struct.ptree_mask* [ %83, %._crit_edge ], [ %59, %._crit_edge21 ]
  %88 = bitcast %struct.ptree_mask* %.05.lcssa29 to i8*
  %89 = bitcast %struct.ptree_mask** %6 to i8**
  %90 = load i8*, i8** %89, align 8
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* %88, i8* %90, i64 16, i32 8, i1 false)
  br label %91

; <label>:91:                                     ; preds = %._crit_edge, %._crit_edge.thread
  %92 = bitcast %struct.ptree_mask** %6 to i8**
  %93 = load i8*, i8** %92, align 8
  tail call void @free(i8* %93) #5
  %94 = bitcast %struct.ptree* %0 to i8*
  tail call void @free(i8* %94) #5
  %95 = load i8, i8* %33, align 8
  %96 = add i8 %95, 1
  store i8 %96, i8* %33, align 8
  %97 = getelementptr inbounds %struct.ptree, %struct.ptree* %23, i64 0, i32 1
  %98 = bitcast %struct.ptree_mask** %97 to i8**
  %99 = load i8*, i8** %98, align 8
  tail call void @free(i8* %99) #5
  store i8* %58, i8** %98, align 8
  br label %121

; <label>:100:                                    ; preds = %.preheader6, %104
  %.324 = phi i32 [ 1, %.preheader6 ], [ %105, %104 ]
  %101 = tail call fastcc i64 @bit(i32 %.324, i64 %31)
  %102 = tail call fastcc i64 @bit(i32 %.324, i64 %32)
  %103 = icmp eq i64 %101, %102
  br i1 %103, label %104, label %.critedge

; <label>:104:                                    ; preds = %100
  %105 = add nuw nsw i32 %.324, 1
  %106 = icmp slt i32 %105, 32
  br i1 %106, label %100, label %.critedge

.critedge:                                        ; preds = %104, %100
  %.3.lcssa = phi i32 [ %105, %104 ], [ %.324, %100 ]
  %107 = getelementptr inbounds %struct.ptree, %struct.ptree* %1, i64 0, i32 3
  %108 = load i8, i8* %107, align 1
  %109 = sext i8 %108 to i32
  %110 = load i64, i64* %12, align 8
  %111 = tail call fastcc i64 @bit(i32 %109, i64 %110)
  %112 = icmp eq i64 %111, 0
  br i1 %112, label %117, label %113

; <label>:113:                                    ; preds = %.critedge
  %114 = getelementptr inbounds %struct.ptree, %struct.ptree* %1, i64 0, i32 5
  %115 = load %struct.ptree*, %struct.ptree** %114, align 8
  %116 = tail call fastcc %struct.ptree* @insertR(%struct.ptree* %115, %struct.ptree* nonnull %0, i32 %.3.lcssa, %struct.ptree* nonnull %1)
  store %struct.ptree* %116, %struct.ptree** %114, align 8
  br label %121

; <label>:117:                                    ; preds = %.critedge
  %118 = getelementptr inbounds %struct.ptree, %struct.ptree* %1, i64 0, i32 4
  %119 = load %struct.ptree*, %struct.ptree** %118, align 8
  %120 = tail call fastcc %struct.ptree* @insertR(%struct.ptree* %119, %struct.ptree* nonnull %0, i32 %.3.lcssa, %struct.ptree* nonnull %1)
  store %struct.ptree* %120, %struct.ptree** %118, align 8
  br label %121

; <label>:121:                                    ; preds = %113, %117, %2, %5, %91, %49
  %.0 = phi %struct.ptree* [ %23, %49 ], [ %23, %91 ], [ null, %5 ], [ null, %2 ], [ %0, %117 ], [ %0, %113 ]
  ret %struct.ptree* %.0
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal fastcc i64 @bit(i32, i64) unnamed_addr #1 {
  %3 = sub nsw i32 31, %0
  %4 = shl i32 1, %3
  %5 = sext i32 %4 to i64
  %6 = and i64 %5, %1
  ret i64 %6
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: noinline nounwind uwtable
define internal fastcc %struct.ptree* @insertR(%struct.ptree*, %struct.ptree*, i32, %struct.ptree* nocapture readonly) unnamed_addr #0 {
  %5 = getelementptr inbounds %struct.ptree, %struct.ptree* %0, i64 0, i32 3
  %6 = load i8, i8* %5, align 1
  %7 = sext i8 %6 to i32
  %8 = icmp slt i32 %7, %2
  br i1 %8, label %9, label %13

; <label>:9:                                      ; preds = %4
  %10 = getelementptr inbounds %struct.ptree, %struct.ptree* %3, i64 0, i32 3
  %11 = load i8, i8* %10, align 1
  %12 = icmp sgt i8 %6, %11
  br i1 %12, label %25, label %13

; <label>:13:                                     ; preds = %9, %4
  %14 = trunc i32 %2 to i8
  %15 = getelementptr inbounds %struct.ptree, %struct.ptree* %1, i64 0, i32 3
  store i8 %14, i8* %15, align 1
  %16 = getelementptr inbounds %struct.ptree, %struct.ptree* %1, i64 0, i32 0
  %17 = load i64, i64* %16, align 8
  %18 = tail call fastcc i64 @bit(i32 %2, i64 %17)
  %19 = icmp eq i64 %18, 0
  %. = select i1 %19, %struct.ptree* %1, %struct.ptree* %0
  %20 = getelementptr inbounds %struct.ptree, %struct.ptree* %1, i64 0, i32 4
  store %struct.ptree* %., %struct.ptree** %20, align 8
  %21 = tail call fastcc i64 @bit(i32 %2, i64 %17)
  %22 = icmp eq i64 %21, 0
  %23 = select i1 %22, %struct.ptree* %0, %struct.ptree* %1
  %24 = getelementptr inbounds %struct.ptree, %struct.ptree* %1, i64 0, i32 5
  store %struct.ptree* %23, %struct.ptree** %24, align 8
  ret %struct.ptree* %1

; <label>:25:                                     ; preds = %9
  %26 = getelementptr inbounds %struct.ptree, %struct.ptree* %1, i64 0, i32 0
  %27 = load i64, i64* %26, align 8
  %28 = tail call fastcc i64 @bit(i32 %7, i64 %27)
  %29 = icmp eq i64 %28, 0
  br i1 %29, label %34, label %30

; <label>:30:                                     ; preds = %25
  %31 = getelementptr inbounds %struct.ptree, %struct.ptree* %0, i64 0, i32 5
  %32 = load %struct.ptree*, %struct.ptree** %31, align 8
  %33 = tail call fastcc %struct.ptree* @insertR(%struct.ptree* %32, %struct.ptree* nonnull %1, i32 %2, %struct.ptree* nonnull %0)
  store %struct.ptree* %33, %struct.ptree** %31, align 8
  ret %struct.ptree* %0

; <label>:34:                                     ; preds = %25
  %35 = getelementptr inbounds %struct.ptree, %struct.ptree* %0, i64 0, i32 4
  %36 = load %struct.ptree*, %struct.ptree** %35, align 8
  %37 = tail call fastcc %struct.ptree* @insertR(%struct.ptree* %36, %struct.ptree* nonnull %1, i32 %2, %struct.ptree* nonnull %0)
  store %struct.ptree* %37, %struct.ptree** %35, align 8
  ret %struct.ptree* %0
}

; Function Attrs: noinline nounwind uwtable
define i32 @pat_remove(%struct.ptree* readonly, %struct.ptree*) local_unnamed_addr #0 {
  ret i32 0
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define %struct.ptree* @pat_search(i64, %struct.ptree* readonly) local_unnamed_addr #4 {
  %3 = icmp eq %struct.ptree* %1, null
  br i1 %3, label %32, label %.preheader.preheader

.preheader.preheader:                             ; preds = %2
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %.02 = phi %struct.ptree* [ %.01..02, %.preheader ], [ null, %.preheader.preheader ]
  %.01 = phi %struct.ptree* [ %19, %.preheader ], [ %1, %.preheader.preheader ]
  %4 = getelementptr inbounds %struct.ptree, %struct.ptree* %.01, i64 0, i32 0
  %5 = load i64, i64* %4, align 8
  %6 = getelementptr inbounds %struct.ptree, %struct.ptree* %.01, i64 0, i32 1
  %7 = load %struct.ptree_mask*, %struct.ptree_mask** %6, align 8
  %8 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %7, i64 0, i32 0
  %9 = load i64, i64* %8, align 8
  %10 = and i64 %9, %0
  %11 = icmp eq i64 %5, %10
  %.01..02 = select i1 %11, %struct.ptree* %.01, %struct.ptree* %.02
  %12 = getelementptr inbounds %struct.ptree, %struct.ptree* %.01, i64 0, i32 3
  %13 = load i8, i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = tail call fastcc i64 @bit(i32 %14, i64 %0)
  %16 = icmp eq i64 %15, 0
  %17 = getelementptr inbounds %struct.ptree, %struct.ptree* %.01, i64 0, i32 5
  %18 = getelementptr inbounds %struct.ptree, %struct.ptree* %.01, i64 0, i32 4
  %.in = select i1 %16, %struct.ptree** %18, %struct.ptree** %17
  %19 = load %struct.ptree*, %struct.ptree** %.in, align 8
  %20 = getelementptr inbounds %struct.ptree, %struct.ptree* %19, i64 0, i32 3
  %21 = load i8, i8* %20, align 1
  %22 = icmp slt i8 %13, %21
  br i1 %22, label %.preheader, label %23

; <label>:23:                                     ; preds = %.preheader
  %24 = getelementptr inbounds %struct.ptree, %struct.ptree* %19, i64 0, i32 0
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds %struct.ptree, %struct.ptree* %19, i64 0, i32 1
  %27 = load %struct.ptree_mask*, %struct.ptree_mask** %26, align 8
  %28 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %27, i64 0, i32 0
  %29 = load i64, i64* %28, align 8
  %30 = and i64 %29, %0
  %31 = icmp eq i64 %25, %30
  %..01..02 = select i1 %31, %struct.ptree* %19, %struct.ptree* %.01..02
  br label %32

; <label>:32:                                     ; preds = %2, %23
  %.0 = phi %struct.ptree* [ %..01..02, %23 ], [ null, %2 ]
  ret %struct.ptree* %.0
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
