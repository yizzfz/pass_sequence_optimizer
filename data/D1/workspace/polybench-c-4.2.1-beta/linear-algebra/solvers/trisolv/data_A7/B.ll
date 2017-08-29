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
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(i32 2000, double* %7)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.lr.ph5, label %._crit_edge6

.lr.ph5:                                          ; preds = %4
  %6 = add i32 %0, 1
  %7 = sitofp i32 %0 to double
  %wide.trip.count13 = zext i32 %0 to i64
  %8 = insertelement <2 x double> undef, double %7, i32 0
  %9 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.lr.ph5
  %indvars.iv11 = phi i64 [ 0, %.lr.ph5 ], [ %indvars.iv.next12, %._crit_edge ]
  %indvars.iv9 = phi i64 [ 1, %.lr.ph5 ], [ %indvars.iv.next10, %._crit_edge ]
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %10 = getelementptr inbounds double, double* %2, i64 %indvars.iv11
  store double -9.990000e+02, double* %10, align 8
  %11 = trunc i64 %indvars.iv11 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds double, double* %3, i64 %indvars.iv11
  store double %12, double* %13, align 8
  %14 = add i32 %6, %11
  %xtraiter14 = and i64 %indvars.iv.next12, 1
  %lcmp.mod = icmp eq i64 %xtraiter14, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %15

; <label>:15:                                     ; preds = %.lr.ph
  %16 = sitofp i32 %14 to double
  %17 = fmul double %16, 2.000000e+00
  %18 = fdiv double %17, %7
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv11, i64 0
  store double %18, double* %19, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %15
  %indvars.iv.unr.ph = phi i64 [ 1, %15 ], [ 0, %.lr.ph ]
  %20 = icmp eq i64 %indvars.iv11, 0
  br i1 %20, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %21 = trunc i64 %indvars.iv to i32
  %22 = sub i32 %14, %21
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %25 = trunc i64 %indvars.iv.next to i32
  %26 = sub i32 %14, %25
  %27 = sitofp i32 %26 to double
  %28 = insertelement <2 x double> undef, double %23, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fmul <2 x double> %29, <double 2.000000e+00, double 2.000000e+00>
  %31 = fdiv <2 x double> %30, %9
  %32 = bitcast double* %24 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv9
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next12, %wide.trip.count13
  br i1 %exitcond, label %._crit_edge6.loopexit, label %.lr.ph

._crit_edge6.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trisolv(i32, [2000 x double]* nocapture readonly, double* nocapture, double* nocapture readonly) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.lr.ph12.preheader, label %._crit_edge13

.lr.ph12.preheader:                               ; preds = %4
  %sunkaddr24 = ptrtoint double* %2 to i64
  %wide.trip.count20 = zext i32 %0 to i64
  br label %.lr.ph12

.lr.ph12:                                         ; preds = %.lr.ph12.preheader, %._crit_edge
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge ], [ 0, %.lr.ph12.preheader ]
  %6 = add i64 %indvars.iv18, 4294967295
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv18
  %8 = bitcast double* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds double, double* %2, i64 %indvars.iv18
  %11 = bitcast double* %10 to i64*
  store i64 %9, i64* %11, align 8
  %12 = icmp sgt i64 %indvars.iv18, 0
  br i1 %12, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph12
  %xtraiter28 = and i64 %indvars.iv18, 1
  %lcmp.mod = icmp eq i64 %xtraiter28, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %13

; <label>:13:                                     ; preds = %.lr.ph
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 0
  %15 = load double, double* %14, align 8
  %16 = load double, double* %2, align 8
  %17 = fmul double %15, %16
  %sunkaddr21 = shl i64 %indvars.iv18, 3
  %sunkaddr22 = add i64 %sunkaddr24, %sunkaddr21
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to double*
  %18 = load double, double* %sunkaddr23, align 8
  %19 = fsub double %18, %17
  store double %19, double* %sunkaddr23, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %13
  %indvars.iv.unr.ph = phi i64 [ 1, %13 ], [ 0, %.lr.ph ]
  %20 = trunc i64 %6 to i32
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %sunkaddr25 = shl i64 %indvars.iv18, 3
  %sunkaddr26 = add i64 %sunkaddr24, %sunkaddr25
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to double*
  %.pre = load double, double* %sunkaddr27, align 8
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %22 = phi double [ %34, %.lr.ph.new ], [ %.pre, %.lr.ph.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %sunkaddr27, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %28, %33
  store double %34, double* %sunkaddr27, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv18
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.lr.ph12
  %sunkaddr6 = shl nsw i64 %indvars.iv18, 3
  %sunkaddr7 = add i64 %sunkaddr24, %sunkaddr6
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to double*
  %35 = load double, double* %sunkaddr8, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 %indvars.iv18
  %37 = load double, double* %36, align 8
  %38 = fdiv double %35, %37
  store double %38, double* %sunkaddr8, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next19, %wide.trip.count20
  br i1 %exitcond, label %._crit_edge13.loopexit, label %.lr.ph12

._crit_edge13.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %18
  %indvars.iv = phi i64 [ %indvars.iv.next, %18 ], [ 0, %.lr.ph.preheader ]
  %9 = phi %struct._IO_FILE* [ %19, %18 ], [ %8, %.lr.ph.preheader ]
  %10 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %11) #5
  %13 = trunc i64 %indvars.iv to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %.lr.ph
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %18

; <label>:18:                                     ; preds = %.lr.ph, %16
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %18
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %.lcssa = phi %struct._IO_FILE* [ %8, %2 ], [ %19, %._crit_edge.loopexit ]
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %.lcssa, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
