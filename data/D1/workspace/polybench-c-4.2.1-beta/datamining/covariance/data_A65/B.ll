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
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #3
  %7 = bitcast i8* %4 to [1200 x double]*
  call void @init_array(double* nonnull %3, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #3
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call void @kernel_covariance(double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  call void @print_array([1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %4) #3
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(double*, [1200 x double]*) #0 {
  store double 1.400000e+03, double* %0, align 8
  br label %.preheader

.preheader:                                       ; preds = %16, %2
  %indvars.iv1 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %16 ]
  %3 = trunc i64 %indvars.iv1 to i32
  %4 = sitofp i32 %3 to double
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %5 ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = sitofp i32 %6 to double
  %8 = fmul double %4, %7
  %9 = fdiv double %8, 1.200000e+03
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv
  store double %9, double* %10, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = trunc i64 %indvars.iv.next to i32
  %12 = sitofp i32 %11 to double
  %13 = fmul double %4, %12
  %14 = fdiv double %13, 1.200000e+03
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv.next
  store double %14, double* %15, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1199
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %16, label %5

; <label>:16:                                     ; preds = %5
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next2, 1400
  br i1 %exitcond1, label %17, label %.preheader

; <label>:17:                                     ; preds = %16
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_covariance(double, [1200 x double]*, [1200 x double]*, double*) #0 {
.lr.ph20:
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr.1 = ptrtoint double* %3 to i64
  %sunkaddr92 = ptrtoint double* %3 to i64
  br label %.lr.ph20.split.us

.lr.ph20.split.us:                                ; preds = %._crit_edge18.us, %.lr.ph20
  %indvars.iv52 = phi i64 [ 0, %.lr.ph20 ], [ %indvars.iv.next53, %._crit_edge18.us ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv52
  store double 0.000000e+00, double* %4, align 8
  %sunkaddr89 = shl i64 %indvars.iv52, 3
  %sunkaddr90 = add i64 %sunkaddr, %sunkaddr89
  %sunkaddr91 = inttoptr i64 %sunkaddr90 to double*
  %sunkaddr89.1 = shl i64 %indvars.iv52, 3
  %sunkaddr90.1 = add i64 %sunkaddr.1, %sunkaddr89.1
  %sunkaddr91.1 = inttoptr i64 %sunkaddr90.1 to double*
  br label %5

; <label>:5:                                      ; preds = %5, %.lr.ph20.split.us
  %indvars.iv48 = phi i64 [ 0, %.lr.ph20.split.us ], [ %indvars.iv.next49.1, %5 ]
  %6 = phi double [ 0.000000e+00, %.lr.ph20.split.us ], [ %12, %5 ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv52
  %8 = load double, double* %7, align 8
  %9 = fadd double %6, %8
  store double %9, double* %sunkaddr91, align 8
  %indvars.iv.next49 = or i64 %indvars.iv48, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next49, i64 %indvars.iv52
  %11 = load double, double* %10, align 8
  %12 = fadd double %9, %11
  store double %12, double* %sunkaddr91.1, align 8
  %exitcond51.1 = icmp eq i64 %indvars.iv.next49, 1399
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  br i1 %exitcond51.1, label %._crit_edge18.us, label %5

._crit_edge18.us:                                 ; preds = %5
  %13 = fdiv double %12, %0
  %sunkaddr93 = shl i64 %indvars.iv52, 3
  %sunkaddr94 = add i64 %sunkaddr92, %sunkaddr93
  %sunkaddr95 = inttoptr i64 %sunkaddr94 to double*
  store double %13, double* %sunkaddr95, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next53, 1200
  br i1 %exitcond6, label %.preheader5.us.preheader, label %.lr.ph20.split.us

.preheader5.us.preheader:                         ; preds = %._crit_edge18.us
  %scevgep75 = getelementptr double, double* %3, i64 1200
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge15.us, %.preheader5.us.preheader
  %indvars.iv45 = phi i64 [ 0, %.preheader5.us.preheader ], [ %indvars.iv.next46, %._crit_edge15.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv45, i64 0
  %14 = add nuw nsw i64 %indvars.iv45, 1
  %scevgep73 = getelementptr [1200 x double], [1200 x double]* %1, i64 %14, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep75
  %bound1 = icmp ugt double* %scevgep73, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph69.preheader, label %vector.body67.preheader

vector.body67.preheader:                          ; preds = %.preheader5.us
  br label %vector.body67

scalar.ph69.preheader:                            ; preds = %.preheader5.us
  br label %scalar.ph69

vector.body67:                                    ; preds = %vector.body67, %vector.body67.preheader
  %index78 = phi i64 [ 0, %vector.body67.preheader ], [ %index.next79.1, %vector.body67 ]
  %15 = getelementptr inbounds double, double* %3, i64 %index78
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv45, i64 %index78
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !4, !noalias !1
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !4, !noalias !1
  %23 = fsub <2 x double> %wide.load87, %wide.load
  %24 = fsub <2 x double> %wide.load88, %wide.load86
  %25 = bitcast double* %19 to <2 x double>*
  store <2 x double> %23, <2 x double>* %25, align 8, !alias.scope !4, !noalias !1
  %26 = bitcast double* %21 to <2 x double>*
  store <2 x double> %24, <2 x double>* %26, align 8, !alias.scope !4, !noalias !1
  %index.next79 = or i64 %index78, 4
  %27 = getelementptr inbounds double, double* %3, i64 %index.next79
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load86.1 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv45, i64 %index.next79
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load87.1 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !4, !noalias !1
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load88.1 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !4, !noalias !1
  %35 = fsub <2 x double> %wide.load87.1, %wide.load.1
  %36 = fsub <2 x double> %wide.load88.1, %wide.load86.1
  %37 = bitcast double* %31 to <2 x double>*
  store <2 x double> %35, <2 x double>* %37, align 8, !alias.scope !4, !noalias !1
  %38 = bitcast double* %33 to <2 x double>*
  store <2 x double> %36, <2 x double>* %38, align 8, !alias.scope !4, !noalias !1
  %index.next79.1 = add nsw i64 %index78, 8
  %39 = icmp eq i64 %index.next79.1, 1200
  br i1 %39, label %._crit_edge15.us.loopexit1, label %vector.body67, !llvm.loop !6

scalar.ph69:                                      ; preds = %scalar.ph69, %scalar.ph69.preheader
  %indvars.iv41 = phi i64 [ 0, %scalar.ph69.preheader ], [ %indvars.iv.next42.3, %scalar.ph69 ]
  %40 = getelementptr inbounds double, double* %3, i64 %indvars.iv41
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv41
  %43 = load double, double* %42, align 8
  %44 = fsub double %43, %41
  store double %44, double* %42, align 8
  %indvars.iv.next42 = or i64 %indvars.iv41, 1
  %45 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next42
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next42
  %48 = load double, double* %47, align 8
  %49 = fsub double %48, %46
  store double %49, double* %47, align 8
  %indvars.iv.next42.1 = or i64 %indvars.iv41, 2
  %50 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next42.1
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next42.1
  %53 = load double, double* %52, align 8
  %54 = fsub double %53, %51
  store double %54, double* %52, align 8
  %indvars.iv.next42.2 = or i64 %indvars.iv41, 3
  %55 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next42.2
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next42.2
  %58 = load double, double* %57, align 8
  %59 = fsub double %58, %56
  store double %59, double* %57, align 8
  %exitcond44.3 = icmp eq i64 %indvars.iv.next42.2, 1199
  %indvars.iv.next42.3 = add nsw i64 %indvars.iv41, 4
  br i1 %exitcond44.3, label %._crit_edge15.us.loopexit, label %scalar.ph69, !llvm.loop !9

._crit_edge15.us.loopexit:                        ; preds = %scalar.ph69
  br label %._crit_edge15.us

._crit_edge15.us.loopexit1:                       ; preds = %vector.body67
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit1, %._crit_edge15.us.loopexit
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next46, 1400
  br i1 %exitcond5, label %.preheader.lr.ph, label %.preheader5.us

.preheader.lr.ph:                                 ; preds = %._crit_edge15.us
  %60 = fadd double %0, -1.000000e+00
  br label %.lr.ph7.us

._crit_edge8.us-lcssa.us.us:                      ; preds = %._crit_edge.us.us
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next32, 1200
  br i1 %exitcond4, label %._crit_edge9, label %.lr.ph7.us

.lr.ph7.us:                                       ; preds = %._crit_edge8.us-lcssa.us.us, %.preheader.lr.ph
  %indvars.iv31 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next32, %._crit_edge8.us-lcssa.us.us ]
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph7.us
  %indvars.iv29 = phi i64 [ %indvars.iv31, %.lr.ph7.us ], [ %indvars.iv.next30, %._crit_edge.us.us ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %indvars.iv29
  store double 0.000000e+00, double* %61, align 8
  br label %64

._crit_edge.us.us:                                ; preds = %64
  %62 = fdiv double %77, %60
  store double %62, double* %61, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv31
  store double %62, double* %63, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next30, 1200
  br i1 %exitcond3, label %._crit_edge8.us-lcssa.us.us, label %.lr.ph.us.us

; <label>:64:                                     ; preds = %64, %.lr.ph.us.us
  %65 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %77, %64 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %64 ]
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv31
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv29
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = fadd double %65, %70
  store double %71, double* %61, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv31
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv29
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fadd double %71, %76
  store double %77, double* %61, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1399
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.us.us, label %64

._crit_edge9:                                     ; preds = %._crit_edge8.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]*) #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv3 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next4, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv3, 1200
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge2
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge2

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond1, label %._crit_edge1, label %.preheader.us

._crit_edge1:                                     ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

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
