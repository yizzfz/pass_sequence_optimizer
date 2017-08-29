; ModuleID = 'debug.ll'
source_filename = "debug.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"%s [%d .. %d]: \00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"%s: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @gsm_debug_words(i8*, i32, i32, i16* nocapture readonly) local_unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0), i8* %0, i32 %1, i32 %2) #2
  %7 = icmp sgt i32 %1, %2
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %7, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %4
  %9 = sext i32 %1 to i64
  %10 = sext i32 %2 to i64
  %11 = sext i32 %2 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.backedge
  %indvars.iv = phi i64 [ %9, %.lr.ph.preheader ], [ %indvars.iv.next, %.backedge ]
  %12 = phi %struct._IO_FILE* [ %8, %.lr.ph.preheader ], [ %22, %.backedge ]
  %.03 = phi i32 [ 0, %.lr.ph.preheader ], [ %.0.be, %.backedge ]
  %13 = getelementptr inbounds i16, i16* %3, i64 %indvars.iv
  %14 = load i16, i16* %13, align 2
  %15 = sext i16 %14 to i32
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %15) #2
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %17 = add nsw i32 %.03, 1
  %18 = icmp sgt i32 %.03, 6
  br i1 %18, label %19, label %.backedge

; <label>:19:                                     ; preds = %.lr.ph
  %20 = icmp slt i64 %indvars.iv.next, %10
  br i1 %20, label %23, label %.backedge

.backedge:                                        ; preds = %19, %23, %.lr.ph
  %.0.be = phi i32 [ 0, %19 ], [ 0, %23 ], [ %17, %.lr.ph ]
  %21 = icmp slt i64 %indvars.iv, %11
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %21, label %.lr.ph, label %._crit_edge.loopexit

; <label>:23:                                     ; preds = %19
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 @_IO_putc(i32 10, %struct._IO_FILE* %24)
  br label %.backedge

._crit_edge.loopexit:                             ; preds = %.backedge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %4
  %.lcssa = phi %struct._IO_FILE* [ %8, %4 ], [ %22, %._crit_edge.loopexit ]
  %26 = tail call i32 @_IO_putc(i32 10, %struct._IO_FILE* %.lcssa)
  ret void
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @_IO_putc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @gsm_debug_longwords(i8*, i32, i32, i64* nocapture readonly) local_unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0), i8* %0, i32 %1, i32 %2) #2
  %7 = icmp sgt i32 %1, %2
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %7, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %4
  %9 = sext i32 %1 to i64
  %10 = sext i32 %2 to i64
  %11 = sext i32 %2 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.backedge
  %indvars.iv = phi i64 [ %9, %.lr.ph.preheader ], [ %indvars.iv.next, %.backedge ]
  %12 = phi %struct._IO_FILE* [ %8, %.lr.ph.preheader ], [ %21, %.backedge ]
  %.03 = phi i32 [ 0, %.lr.ph.preheader ], [ %.0.be, %.backedge ]
  %13 = getelementptr inbounds i64, i64* %3, i64 %indvars.iv
  %14 = load i64, i64* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i64 %14) #2
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %16 = add nsw i32 %.03, 1
  %17 = icmp sgt i32 %.03, 6
  br i1 %17, label %18, label %.backedge

; <label>:18:                                     ; preds = %.lr.ph
  %19 = icmp slt i64 %indvars.iv.next, %10
  br i1 %19, label %22, label %.backedge

.backedge:                                        ; preds = %18, %22, %.lr.ph
  %.0.be = phi i32 [ 0, %18 ], [ 0, %22 ], [ %16, %.lr.ph ]
  %20 = icmp slt i64 %indvars.iv, %11
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %20, label %.lr.ph, label %._crit_edge.loopexit

; <label>:22:                                     ; preds = %18
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 @_IO_putc(i32 10, %struct._IO_FILE* %23)
  br label %.backedge

._crit_edge.loopexit:                             ; preds = %.backedge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %4
  %.lcssa = phi %struct._IO_FILE* [ %8, %4 ], [ %21, %._crit_edge.loopexit ]
  %25 = tail call i32 @_IO_putc(i32 10, %struct._IO_FILE* %.lcssa)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @gsm_debug_longword(i8*, i64) local_unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), i8* %0, i64 %1) #2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @gsm_debug_word(i8*, i16 signext) local_unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = sext i16 %1 to i64
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), i8* %0, i64 %4) #2
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
