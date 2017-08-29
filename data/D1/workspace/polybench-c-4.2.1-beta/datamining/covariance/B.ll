; ModuleID = 'A.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
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
  call void @init_array(i32 1400, double* nonnull %3, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call void @kernel_covariance(i32 1200, i32 1400, double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  call void @print_array(i32 1200, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, double*, [1200 x double]*) #2 {
  store double 1.400000e+03, double* %1, align 8
  br label %.preheader

.preheader:                                       ; preds = %19, %3
  %indvars.iv6 = phi i64 [ 0, %3 ], [ %indvars.iv.next7, %19 ]
  %4 = trunc i64 %indvars.iv6 to i32
  %5 = sitofp i32 %4 to double
  br label %6

; <label>:6:                                      ; preds = %6, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %6 ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %10 = trunc i64 %indvars.iv.next to i32
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %5, i32 0
  %13 = insertelement <2 x double> %12, double %5, i32 1
  %14 = insertelement <2 x double> undef, double %8, i32 0
  %15 = insertelement <2 x double> %14, double %11, i32 1
  %16 = fmul <2 x double> %15, %13
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = bitcast double* %9 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1199
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %19, label %6

; <label>:19:                                     ; preds = %6
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1400
  br i1 %exitcond8, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_covariance(i32, i32, double, [1200 x double]*, [1200 x double]*, double*) #2 {
.lr.ph25:
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr.1 = ptrtoint double* %5 to i64
  %sunkaddr120 = ptrtoint double* %5 to i64
  br label %.lr.ph25.split.us

.lr.ph25.split.us:                                ; preds = %.loopexit29.us, %.lr.ph25
  %indvars.iv95 = phi i64 [ 0, %.lr.ph25 ], [ %indvars.iv.next96, %.loopexit29.us ]
  %sext105 = shl i64 %indvars.iv95, 32
  %6 = ashr exact i64 %sext105, 32
  %7 = getelementptr inbounds double, double* %5, i64 %6
  store double 0.000000e+00, double* %7, align 8
  %8 = getelementptr inbounds double, double* %5, i64 %indvars.iv95
  %.pre = load double, double* %8, align 8
  %sunkaddr117 = shl nuw nsw i64 %indvars.iv95, 3
  %sunkaddr118 = add i64 %sunkaddr, %sunkaddr117
  %sunkaddr119 = inttoptr i64 %sunkaddr118 to double*
  %sunkaddr117.1 = shl nuw nsw i64 %indvars.iv95, 3
  %sunkaddr118.1 = add i64 %sunkaddr.1, %sunkaddr117.1
  %sunkaddr119.1 = inttoptr i64 %sunkaddr118.1 to double*
  br label %9

; <label>:9:                                      ; preds = %9, %.lr.ph25.split.us
  %10 = phi double [ %.pre, %.lr.ph25.split.us ], [ %16, %9 ]
  %indvars.iv91 = phi i64 [ 0, %.lr.ph25.split.us ], [ %indvars.iv.next92.1, %9 ]
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv91, i64 %indvars.iv95
  %12 = load double, double* %11, align 8
  %13 = fadd double %12, %10
  store double %13, double* %sunkaddr119, align 8
  %indvars.iv.next92 = or i64 %indvars.iv91, 1
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next92, i64 %indvars.iv95
  %15 = load double, double* %14, align 8
  %16 = fadd double %15, %13
  store double %16, double* %sunkaddr119.1, align 8
  %exitcond94.1 = icmp eq i64 %indvars.iv.next92, 1399
  %indvars.iv.next92.1 = add nsw i64 %indvars.iv91, 2
  br i1 %exitcond94.1, label %.loopexit29.us, label %9

.loopexit29.us:                                   ; preds = %9
  %17 = fdiv double %16, %2
  %sunkaddr121 = shl nuw nsw i64 %indvars.iv95, 3
  %sunkaddr122 = add i64 %sunkaddr120, %sunkaddr121
  %sunkaddr123 = inttoptr i64 %sunkaddr122 to double*
  store double %17, double* %sunkaddr123, align 8
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond115 = icmp eq i64 %indvars.iv.next96, 1200
  br i1 %exitcond115, label %.preheader8.lr.ph..preheader8.us_crit_edge, label %.lr.ph25.split.us

.preheader8.lr.ph..preheader8.us_crit_edge:       ; preds = %.loopexit29.us
  %scevgep146 = getelementptr double, double* %5, i64 1200
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %.loopexit28.us, %.preheader8.lr.ph..preheader8.us_crit_edge
  %indvars.iv89 = phi i64 [ 0, %.preheader8.lr.ph..preheader8.us_crit_edge ], [ %indvars.iv.next90, %.loopexit28.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 0
  %18 = add nuw nsw i64 %indvars.iv89, 1
  %scevgep144 = getelementptr [1200 x double], [1200 x double]* %3, i64 %18, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep146
  %bound1 = icmp ugt double* %scevgep144, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph140.preheader, label %vector.body138.preheader

vector.body138.preheader:                         ; preds = %.preheader8.us
  br label %vector.body138

scalar.ph140.preheader:                           ; preds = %.preheader8.us
  br label %scalar.ph140

vector.body138:                                   ; preds = %vector.body138, %vector.body138.preheader
  %index149 = phi i64 [ 0, %vector.body138.preheader ], [ %index.next150.1, %vector.body138 ]
  %19 = getelementptr inbounds double, double* %5, i64 %index149
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load157 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load158 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 %index149
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load159 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !4, !noalias !1
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load160 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !4, !noalias !1
  %27 = fsub <2 x double> %wide.load159, %wide.load157
  %28 = fsub <2 x double> %wide.load160, %wide.load158
  %29 = bitcast double* %23 to <2 x double>*
  store <2 x double> %27, <2 x double>* %29, align 8, !alias.scope !4, !noalias !1
  %30 = bitcast double* %25 to <2 x double>*
  store <2 x double> %28, <2 x double>* %30, align 8, !alias.scope !4, !noalias !1
  %index.next150 = or i64 %index149, 4
  %31 = getelementptr inbounds double, double* %5, i64 %index.next150
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load157.1 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load158.1 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 %index.next150
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load159.1 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !4, !noalias !1
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load160.1 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !4, !noalias !1
  %39 = fsub <2 x double> %wide.load159.1, %wide.load157.1
  %40 = fsub <2 x double> %wide.load160.1, %wide.load158.1
  %41 = bitcast double* %35 to <2 x double>*
  store <2 x double> %39, <2 x double>* %41, align 8, !alias.scope !4, !noalias !1
  %42 = bitcast double* %37 to <2 x double>*
  store <2 x double> %40, <2 x double>* %42, align 8, !alias.scope !4, !noalias !1
  %index.next150.1 = add nsw i64 %index149, 8
  %43 = icmp eq i64 %index.next150.1, 1200
  br i1 %43, label %.loopexit28.us.loopexit161, label %vector.body138, !llvm.loop !6

scalar.ph140:                                     ; preds = %scalar.ph140, %scalar.ph140.preheader
  %indvars.iv85 = phi i64 [ 0, %scalar.ph140.preheader ], [ %indvars.iv.next86.3, %scalar.ph140 ]
  %44 = getelementptr inbounds double, double* %5, i64 %indvars.iv85
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 %indvars.iv85
  %47 = load double, double* %46, align 8
  %48 = fsub double %47, %45
  store double %48, double* %46, align 8
  %indvars.iv.next86 = or i64 %indvars.iv85, 1
  %49 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next86
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 %indvars.iv.next86
  %52 = load double, double* %51, align 8
  %53 = fsub double %52, %50
  store double %53, double* %51, align 8
  %indvars.iv.next86.1 = or i64 %indvars.iv85, 2
  %54 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next86.1
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 %indvars.iv.next86.1
  %57 = load double, double* %56, align 8
  %58 = fsub double %57, %55
  store double %58, double* %56, align 8
  %indvars.iv.next86.2 = or i64 %indvars.iv85, 3
  %59 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next86.2
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 %indvars.iv.next86.2
  %62 = load double, double* %61, align 8
  %63 = fsub double %62, %60
  store double %63, double* %61, align 8
  %exitcond88.3 = icmp eq i64 %indvars.iv.next86.2, 1199
  %indvars.iv.next86.3 = add nsw i64 %indvars.iv85, 4
  br i1 %exitcond88.3, label %.loopexit28.us.loopexit, label %scalar.ph140, !llvm.loop !9

.loopexit28.us.loopexit:                          ; preds = %scalar.ph140
  br label %.loopexit28.us

.loopexit28.us.loopexit161:                       ; preds = %vector.body138
  br label %.loopexit28.us

.loopexit28.us:                                   ; preds = %.loopexit28.us.loopexit161, %.loopexit28.us.loopexit
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond114 = icmp eq i64 %indvars.iv.next90, 1400
  br i1 %exitcond114, label %.preheader.lr.ph, label %.preheader8.us

.preheader.lr.ph:                                 ; preds = %.loopexit28.us
  %64 = fadd double %2, -1.000000e+00
  br label %.lr.ph12.us

.lr.ph12.us:                                      ; preds = %.loopexit26.us-lcssa.us.us, %.preheader.lr.ph
  %indvars.iv127 = phi i64 [ %indvars.iv.next128, %.loopexit26.us-lcssa.us.us ], [ 0, %.preheader.lr.ph ]
  br label %.lr.ph.us.us

.loopexit26.us-lcssa.us.us:                       ; preds = %.loopexit.us.us
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %exitcond129 = icmp eq i64 %indvars.iv.next128, 1200
  br i1 %exitcond129, label %.preheader7._crit_edge, label %.lr.ph12.us

.lr.ph.us.us:                                     ; preds = %.loopexit.us.us, %.lr.ph12.us
  %indvars.iv77 = phi i64 [ %indvars.iv127, %.lr.ph12.us ], [ %indvars.iv.next78, %.loopexit.us.us ]
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv127, i64 %indvars.iv77
  store double 0.000000e+00, double* %65, align 8
  br label %68

.loopexit.us.us:                                  ; preds = %68
  %66 = fdiv double %81, %64
  store double %66, double* %65, align 8
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv77, i64 %indvars.iv127
  store double %66, double* %67, align 8
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond112 = icmp eq i64 %indvars.iv.next78, 1200
  br i1 %exitcond112, label %.loopexit26.us-lcssa.us.us, label %.lr.ph.us.us

; <label>:68:                                     ; preds = %68, %.lr.ph.us.us
  %69 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %81, %68 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %68 ]
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv127
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv77
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fadd double %74, %69
  store double %75, double* %65, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv127
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv77
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = fadd double %80, %75
  store double %81, double* %65, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1399
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %.loopexit.us.us, label %68

.preheader7._crit_edge:                           ; preds = %.loopexit26.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]*) #0 {
.preheader.lr.ph..preheader.us_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv14 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next15, %.loopexit.us ]
  %6 = mul nuw nsw i64 %indvars.iv14, 1200
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge11, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge11 ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge11

; <label>:11:                                     ; preds = %._crit_edge12
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge12, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %.loopexit.us, label %._crit_edge12

.loopexit.us:                                     ; preds = %._crit_edge11
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond16, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %.loopexit.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
