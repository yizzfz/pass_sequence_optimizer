; ModuleID = 'cdjpeg.ll'
source_filename = "cdjpeg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdin = external local_unnamed_addr global %struct._IO_FILE*, align 8
@stdout = external local_unnamed_addr global %struct._IO_FILE*, align 8

; Function Attrs: noinline nounwind readonly uwtable
define i32 @keymatch(i8* nocapture readonly, i8* nocapture readonly, i32) local_unnamed_addr #0 {
  %4 = load i8, i8* %0, align 1
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %._crit_edge, label %..lr.ph_crit_edge

..lr.ph_crit_edge:                                ; preds = %3
  %6 = load i8, i8* %1, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %.loopexit, label %.lr.ph13.preheader

.lr.ph13.preheader:                               ; preds = %..lr.ph_crit_edge
  %8 = tail call i16** @__ctype_b_loc() #4
  %9 = load i16*, i16** %8, align 8
  br label %.lr.ph13

.lr.ph:                                           ; preds = %25
  %10 = load i8, i8* %14, align 1
  %11 = icmp eq i8 %10, 0
  br i1 %11, label %.loopexit.loopexit, label %.lr.ph13

.lr.ph13:                                         ; preds = %.lr.ph13.preheader, %.lr.ph
  %.in = phi i8 [ %10, %.lr.ph ], [ %6, %.lr.ph13.preheader ]
  %.pn = phi i8* [ %14, %.lr.ph ], [ %1, %.lr.ph13.preheader ]
  %.in14 = phi i8 [ %27, %.lr.ph ], [ %4, %.lr.ph13.preheader ]
  %.pn15 = phi i8* [ %12, %.lr.ph ], [ %0, %.lr.ph13.preheader ]
  %.03612 = phi i32 [ %26, %.lr.ph ], [ 0, %.lr.ph13.preheader ]
  %12 = getelementptr inbounds i8, i8* %.pn15, i64 1
  %13 = sext i8 %.in14 to i32
  %14 = getelementptr inbounds i8, i8* %.pn, i64 1
  %15 = sext i8 %.in to i32
  %16 = sext i8 %.in14 to i64
  %17 = getelementptr inbounds i16, i16* %9, i64 %16
  %18 = load i16, i16* %17, align 2
  %19 = and i16 %18, 256
  %20 = icmp eq i16 %19, 0
  br i1 %20, label %23, label %21

; <label>:21:                                     ; preds = %.lr.ph13
  %22 = tail call i32 @tolower(i32 %13) #5
  br label %23

; <label>:23:                                     ; preds = %.lr.ph13, %21
  %.04 = phi i32 [ %22, %21 ], [ %13, %.lr.ph13 ]
  %24 = icmp eq i32 %.04, %15
  br i1 %24, label %25, label %.loopexit.loopexit

; <label>:25:                                     ; preds = %23
  %26 = add nuw nsw i32 %.03612, 1
  %27 = load i8, i8* %12, align 1
  %28 = icmp eq i8 %27, 0
  br i1 %28, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %25
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  %.03.lcssa = phi i32 [ 0, %3 ], [ %26, %._crit_edge.loopexit ]
  %not. = icmp sge i32 %.03.lcssa, %2
  %. = zext i1 %not. to i32
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph, %23
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %..lr.ph_crit_edge, %._crit_edge
  %.0 = phi i32 [ %., %._crit_edge ], [ 0, %..lr.ph_crit_edge ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() local_unnamed_addr #1

; Function Attrs: nounwind readonly
declare i32 @tolower(i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind readonly uwtable
define %struct._IO_FILE* @read_stdin() local_unnamed_addr #3 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  ret %struct._IO_FILE* %1
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define %struct._IO_FILE* @write_stdout() local_unnamed_addr #3 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  ret %struct._IO_FILE* %1
}

attributes #0 = { noinline nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
