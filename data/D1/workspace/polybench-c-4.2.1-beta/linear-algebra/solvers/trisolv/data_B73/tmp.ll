; ModuleID = 'A.ll'
source_filename = "trisolv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = bitcast i8* %3 to [2000 x double]*
  %7 = bitcast i8* %4 to double*
  %8 = bitcast i8* %5 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %6, double* %7, double* %8)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_trisolv(i32 2000, [2000 x double]* %6, double* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %4 to double*
  tail call fastcc void @print_array(i32 2000, double* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph2:
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.lr.ph2
  %indvars.iv8 = phi i64 [ 0, %.lr.ph2 ], [ %indvars.iv.next9, %._crit_edge ]
  %4 = getelementptr inbounds double, double* %2, i64 %indvars.iv8
  store double -9.990000e+02, double* %4, align 8
  %5 = trunc i64 %indvars.iv8 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv8
  store double %6, double* %7, align 8
  %8 = trunc i64 %indvars.iv8 to i32
  %9 = add i32 %8, 2001
  %10 = and i64 %indvars.iv8, 1
  %lcmp.mod = icmp eq i64 %10, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  br label %11

; <label>:11:                                     ; preds = %.prol.preheader
  %12 = sitofp i32 %9 to double
  %13 = fmul double %12, 2.000000e+00
  %14 = fdiv double %13, 2.000000e+03
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv8, i64 0
  store double %14, double* %15, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %11
  %indvars.iv.unr.ph = phi i64 [ 1, %11 ], [ 0, %.lr.ph ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  %16 = icmp eq i64 %indvars.iv8, 0
  br i1 %16, label %._crit_edge, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %17

; <label>:17:                                     ; preds = %17, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %17 ]
  %18 = trunc i64 %indvars.iv to i32
  %19 = sub i32 %9, %18
  %20 = sitofp i32 %19 to double
  %21 = fmul double %20, 2.000000e+00
  %22 = fdiv double %21, 2.000000e+03
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv8, i64 %indvars.iv
  store double %22, double* %23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %24 = trunc i64 %indvars.iv.next to i32
  %25 = sub i32 %9, %24
  %26 = sitofp i32 %25 to double
  %27 = fmul double %26, 2.000000e+00
  %28 = fdiv double %27, 2.000000e+03
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv8, i64 %indvars.iv.next
  store double %28, double* %29, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %indvars.iv8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.unr-lcssa, label %17

._crit_edge.unr-lcssa:                            ; preds = %17
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit, %._crit_edge.unr-lcssa
  %indvars.iv.next9 = add nuw i64 %indvars.iv8, 1
  %30 = icmp slt i64 %indvars.iv.next9, 2000
  br i1 %30, label %.lr.ph, label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trisolv(i32, [2000 x double]* nocapture readonly, double*, double* nocapture readonly) unnamed_addr #2 {
.lr.ph9:
  %sunkaddr4 = ptrtoint double* %2 to i64
  %sunkaddr = ptrtoint double* %2 to i64
  br label %4

; <label>:4:                                      ; preds = %._crit_edge, %.lr.ph9
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %._crit_edge ], [ 0, %.lr.ph9 ]
  %indvars.iv15 = phi i32 [ %indvars.iv.next16, %._crit_edge ], [ -1, %.lr.ph9 ]
  %5 = add i64 %indvars.iv17, 4294967295
  %6 = and i64 %5, 4294967295
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv17
  %8 = load double, double* %7, align 8
  %9 = getelementptr inbounds double, double* %2, i64 %indvars.iv17
  store double %8, double* %9, align 8
  %10 = icmp sgt i64 %indvars.iv17, 0
  br i1 %10, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %4
  %sunkaddr1 = shl nsw i64 %indvars.iv17, 3
  %sunkaddr2 = add i64 %sunkaddr, %sunkaddr1
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to double*
  %wide.trip.count = zext i32 %indvars.iv15 to i64
  %11 = and i64 %5, 1
  %lcmp.mod = icmp eq i64 %11, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  br label %12

; <label>:12:                                     ; preds = %.prol.preheader
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv17, i64 0
  %14 = load double, double* %13, align 8
  %15 = load double, double* %2, align 8
  %16 = fmul double %14, %15
  %17 = fsub double %8, %16
  store double %17, double* %sunkaddr3, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %12
  %.lcssa21.unr.ph = phi double [ %17, %12 ], [ undef, %.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %12 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %17, %12 ], [ %8, %.lr.ph ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  %18 = icmp eq i64 %6, 0
  br i1 %18, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %19

; <label>:19:                                     ; preds = %19, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %19 ]
  %20 = phi double [ %.unr.ph, %.lr.ph.new ], [ %32, %19 ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv17, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  store double %26, double* %sunkaddr3, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv17, i64 %indvars.iv.next
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fsub double %26, %31
  store double %32, double* %sunkaddr3, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %19

._crit_edge.loopexit.unr-lcssa:                   ; preds = %19
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa21 = phi double [ %.lcssa21.unr.ph, %.prol.loopexit ], [ %32, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %4
  %.lcssa = phi double [ %8, %4 ], [ %.lcssa21, %._crit_edge.loopexit ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv17, i64 %indvars.iv17
  %34 = load double, double* %33, align 8
  %35 = fdiv double %.lcssa, %34
  %sunkaddr5 = shl nsw i64 %indvars.iv17, 3
  %sunkaddr6 = add i64 %sunkaddr4, %sunkaddr5
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to double*
  store double %35, double* %sunkaddr7, align 8
  %indvars.iv.next18 = add nuw i64 %indvars.iv17, 1
  %36 = icmp slt i64 %indvars.iv.next18, 2000
  %indvars.iv.next16 = add nsw i32 %indvars.iv15, 1
  br i1 %36, label %4, label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
..lr.ph_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge, %..lr.ph_crit_edge
  %indvars.iv = phi i64 [ 0, %..lr.ph_crit_edge ], [ %indvars.iv.next, %.lr.ph._crit_edge ]
  %7 = phi %struct._IO_FILE* [ %6, %..lr.ph_crit_edge ], [ %17, %.lr.ph._crit_edge ]
  %8 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %9) #6
  %11 = trunc i64 %indvars.iv to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %.lr.ph._crit_edge

; <label>:14:                                     ; preds = %.lr.ph
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %14
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %16 = icmp slt i64 %indvars.iv.next, 2000
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %16, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph._crit_edge
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
