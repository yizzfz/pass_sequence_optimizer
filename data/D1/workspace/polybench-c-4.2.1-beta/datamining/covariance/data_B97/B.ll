; ModuleID = 'A.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = bitcast i8* %4 to [1200 x double]*
  call void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call void @kernel_covariance(i32 1200, i32 1400, double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call void @print_array(i32 1200, [1200 x double]* %9)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double* nocapture, [1200 x double]*) #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %.preheader

.preheader:                                       ; preds = %18, %4
  %indvars.iv9 = phi i64 [ 0, %4 ], [ %indvars.iv.next10, %18 ]
  %5 = trunc i64 %indvars.iv9 to i32
  %6 = sitofp i32 %5 to double
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %7 ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = sitofp i32 %8 to double
  %10 = fmul double %6, %9
  %11 = fdiv double %10, 1.200000e+03
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv9, i64 %indvars.iv
  store double %11, double* %12, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = trunc i64 %indvars.iv.next to i32
  %14 = sitofp i32 %13 to double
  %15 = fmul double %6, %14
  %16 = fdiv double %15, 1.200000e+03
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv9, i64 %indvars.iv.next
  store double %16, double* %17, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %18, label %7

; <label>:18:                                     ; preds = %7
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next10, 1400
  br i1 %exitcond, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_covariance(i32, i32, double, [1200 x double]*, [1200 x double]*, double*) #2 {
.lr.ph80:
  br label %.lr.ph80.split.us

.lr.ph80.split.us:                                ; preds = %._crit_edge77.us, %.lr.ph80
  %indvars.iv130 = phi i64 [ 0, %.lr.ph80 ], [ %indvars.iv.next131, %._crit_edge77.us ]
  %6 = getelementptr inbounds double, double* %5, i64 %indvars.iv130
  store double 0.000000e+00, double* %6, align 8
  br label %.lr.ph80.split.us.new

.lr.ph80.split.us.new:                            ; preds = %.lr.ph80.split.us, %.lr.ph80.split.us.new
  %indvars.iv121 = phi i64 [ %indvars.iv.next122.3, %.lr.ph80.split.us.new ], [ 0, %.lr.ph80.split.us ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv121, i64 %indvars.iv130
  %8 = load double, double* %7, align 8
  %9 = load double, double* %6, align 8
  %10 = fadd double %8, %9
  store double %10, double* %6, align 8
  %indvars.iv.next122 = or i64 %indvars.iv121, 1
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next122, i64 %indvars.iv130
  %12 = load double, double* %11, align 8
  %13 = fadd double %12, %10
  store double %13, double* %6, align 8
  %indvars.iv.next122.1 = or i64 %indvars.iv121, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next122.1, i64 %indvars.iv130
  %15 = load double, double* %14, align 8
  %16 = fadd double %15, %13
  store double %16, double* %6, align 8
  %indvars.iv.next122.2 = or i64 %indvars.iv121, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next122.2, i64 %indvars.iv130
  %18 = load double, double* %17, align 8
  %19 = fadd double %18, %16
  store double %19, double* %6, align 8
  %indvars.iv.next122.3 = add nsw i64 %indvars.iv121, 4
  %exitcond124.3 = icmp eq i64 %indvars.iv.next122.3, 1400
  br i1 %exitcond124.3, label %._crit_edge77.us, label %.lr.ph80.split.us.new

._crit_edge77.us:                                 ; preds = %.lr.ph80.split.us.new
  %20 = load double, double* %6, align 8
  %21 = fdiv double %20, %2
  store double %21, double* %6, align 8
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %exitcond133 = icmp eq i64 %indvars.iv.next131, 1200
  br i1 %exitcond133, label %.preheader56.us.preheader, label %.lr.ph80.split.us

.preheader56.us.preheader:                        ; preds = %._crit_edge77.us
  %scevgep196 = getelementptr double, double* %5, i64 1200
  br label %.preheader56.us

.preheader56.us:                                  ; preds = %.preheader56.us.preheader, %._crit_edge72.us
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %._crit_edge72.us ], [ 0, %.preheader56.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv116, i64 0
  %scevgep191 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv116, i64 1200
  %bound0 = icmp ult double* %scevgep, %scevgep196
  %bound1 = icmp ugt double* %scevgep191, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.preheader56.us.new.preheader, label %vector.body179.preheader

vector.body179.preheader:                         ; preds = %.preheader56.us
  br label %vector.body179

.preheader56.us.new.preheader:                    ; preds = %.preheader56.us
  br label %.preheader56.us.new

vector.body179:                                   ; preds = %vector.body179.preheader, %vector.body179
  %index199 = phi i64 [ %index.next200, %vector.body179 ], [ 0, %vector.body179.preheader ]
  %22 = shl i64 %index199, 2
  %23 = getelementptr inbounds double, double* %5, i64 %22
  %24 = bitcast double* %23 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %24, align 8, !alias.scope !1
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv116, i64 %22
  %26 = bitcast double* %25 to <8 x double>*
  %wide.vec211 = load <8 x double>, <8 x double>* %26, align 8, !alias.scope !4, !noalias !1
  %27 = fsub <8 x double> %wide.vec211, %wide.vec
  %28 = shufflevector <8 x double> %27, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %29 = fsub <8 x double> %wide.vec211, %wide.vec
  %30 = shufflevector <8 x double> %29, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %31 = fsub <8 x double> %wide.vec211, %wide.vec
  %32 = shufflevector <8 x double> %31, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %33 = or i64 %22, 3
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv116, i64 %33
  %35 = fsub <8 x double> %wide.vec211, %wide.vec
  %36 = shufflevector <8 x double> %35, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %37 = getelementptr double, double* %34, i64 -3
  %38 = bitcast double* %37 to <8 x double>*
  %39 = shufflevector <2 x double> %28, <2 x double> %30, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %40 = shufflevector <2 x double> %32, <2 x double> %36, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec216 = shufflevector <4 x double> %39, <4 x double> %40, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec216, <8 x double>* %38, align 8, !alias.scope !4, !noalias !1
  %index.next200 = add i64 %index199, 2
  %41 = icmp eq i64 %index.next200, 300
  br i1 %41, label %._crit_edge72.us.loopexit252, label %vector.body179, !llvm.loop !6

.preheader56.us.new:                              ; preds = %.preheader56.us.new.preheader, %.preheader56.us.new
  %indvars.iv108 = phi i64 [ %indvars.iv.next109.3, %.preheader56.us.new ], [ 0, %.preheader56.us.new.preheader ]
  %42 = getelementptr inbounds double, double* %5, i64 %indvars.iv108
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv116, i64 %indvars.iv108
  %45 = load double, double* %44, align 8
  %46 = fsub double %45, %43
  store double %46, double* %44, align 8
  %indvars.iv.next109 = or i64 %indvars.iv108, 1
  %47 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next109
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv116, i64 %indvars.iv.next109
  %50 = load double, double* %49, align 8
  %51 = fsub double %50, %48
  store double %51, double* %49, align 8
  %indvars.iv.next109.1 = or i64 %indvars.iv108, 2
  %52 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next109.1
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv116, i64 %indvars.iv.next109.1
  %55 = load double, double* %54, align 8
  %56 = fsub double %55, %53
  store double %56, double* %54, align 8
  %indvars.iv.next109.2 = or i64 %indvars.iv108, 3
  %57 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next109.2
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv116, i64 %indvars.iv.next109.2
  %60 = load double, double* %59, align 8
  %61 = fsub double %60, %58
  store double %61, double* %59, align 8
  %indvars.iv.next109.3 = add nsw i64 %indvars.iv108, 4
  %exitcond111.3 = icmp eq i64 %indvars.iv.next109.3, 1200
  br i1 %exitcond111.3, label %._crit_edge72.us.loopexit, label %.preheader56.us.new, !llvm.loop !9

._crit_edge72.us.loopexit:                        ; preds = %.preheader56.us.new
  br label %._crit_edge72.us

._crit_edge72.us.loopexit252:                     ; preds = %vector.body179
  br label %._crit_edge72.us

._crit_edge72.us:                                 ; preds = %._crit_edge72.us.loopexit252, %._crit_edge72.us.loopexit
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %exitcond119 = icmp eq i64 %indvars.iv.next117, 1400
  br i1 %exitcond119, label %.preheader.lr.ph, label %.preheader56.us

.preheader.lr.ph:                                 ; preds = %._crit_edge72.us
  %62 = fadd double %2, -1.000000e+00
  br label %.lr.ph60.us

._crit_edge61.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %exitcond93 = icmp eq i64 %indvars.iv.next91, 1200
  br i1 %exitcond93, label %._crit_edge63, label %.lr.ph60.us

.lr.ph60.us:                                      ; preds = %.preheader.lr.ph, %._crit_edge61.us-lcssa.us.us
  %indvars.iv90 = phi i64 [ %indvars.iv.next91, %._crit_edge61.us-lcssa.us.us ], [ 0, %.preheader.lr.ph ]
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph60.us
  %indvars.iv86 = phi i64 [ %indvars.iv90, %.lr.ph60.us ], [ %indvars.iv.next87, %._crit_edge.us.us ]
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv90, i64 %indvars.iv86
  store double 0.000000e+00, double* %63, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new
  %64 = load double, double* %63, align 8
  %65 = fdiv double %64, %62
  store double %65, double* %63, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv86, i64 %indvars.iv90
  store double %65, double* %66, align 8
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond = icmp eq i64 %indvars.iv.next87, 1200
  br i1 %exitcond, label %._crit_edge61.us-lcssa.us.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv90
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv86
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = load double, double* %63, align 8
  %73 = fadd double %72, %71
  store double %73, double* %63, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv90
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv86
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = load double, double* %63, align 8
  %80 = fadd double %79, %78
  store double %80, double* %63, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.lr.ph.us.us.new

._crit_edge63:                                    ; preds = %._crit_edge61.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]*) #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next14, %._crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv13, 1200
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %14 ]
  %8 = add nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %12, %7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %7

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond16, label %._crit_edge12, label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
