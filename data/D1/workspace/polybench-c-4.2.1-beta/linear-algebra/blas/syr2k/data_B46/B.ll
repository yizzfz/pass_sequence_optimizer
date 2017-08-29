; ModuleID = 'A.ll'
source_filename = "syr2k.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call void @init_array(double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call void @kernel_syr2k(double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  call void @print_array([1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) #2 {
.lr.ph8:
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.lr.ph5

.lr.ph5:                                          ; preds = %._crit_edge6, %.lr.ph8
  %indvars.iv16 = phi i64 [ 0, %.lr.ph8 ], [ %indvars.iv.next17, %._crit_edge6 ]
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.lr.ph5
  %indvars.iv13 = phi i64 [ 0, %.lr.ph5 ], [ %indvars.iv.next14, %._crit_edge1 ]
  %5 = mul nuw nsw i64 %indvars.iv16, %indvars.iv13
  %6 = add nuw nsw i64 %5, 1
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 1200
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv16, i64 %indvars.iv13
  %11 = add nuw nsw i64 %5, 2
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 1000
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %9, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.000000e+03>
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  store double %18, double* %10, align 8
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv16, i64 %indvars.iv13
  store double %19, double* %20, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1000
  br i1 %exitcond15, label %._crit_edge6, label %._crit_edge1

._crit_edge6:                                     ; preds = %._crit_edge1
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1200
  br i1 %exitcond18, label %.lr.ph2.preheader, label %.lr.ph5

.lr.ph2.preheader:                                ; preds = %._crit_edge6
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %.lr.ph2.preheader, %._crit_edge
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge ], [ 0, %.lr.ph2.preheader ]
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %.lr.ph2
  %indvars.iv = phi i64 [ 0, %.lr.ph2 ], [ %indvars.iv.next, %._crit_edge2 ]
  %21 = mul nuw nsw i64 %indvars.iv10, %indvars.iv
  %22 = add nuw nsw i64 %21, 3
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 1200
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, 1.000000e+03
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv
  store double %26, double* %27, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge, label %._crit_edge2

._crit_edge:                                      ; preds = %._crit_edge2
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 1200
  br i1 %exitcond12, label %._crit_edge3, label %.lr.ph2

._crit_edge3:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) #2 {
.lr.ph8:
  %5 = insertelement <2 x double> undef, double %1, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  %7 = insertelement <2 x double> undef, double %1, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge6..lr.ph_crit_edge, %.lr.ph8
  %indvars.iv27 = phi i2 [ 1, %.lr.ph8 ], [ %indvars.iv.next, %._crit_edge6..lr.ph_crit_edge ]
  %indvars.iv24 = phi i64 [ 0, %.lr.ph8 ], [ %indvars.iv.next25, %._crit_edge6..lr.ph_crit_edge ]
  %indvars.iv22 = phi i64 [ 1, %.lr.ph8 ], [ %indvars.iv.next23, %._crit_edge6..lr.ph_crit_edge ]
  %9 = add i64 %indvars.iv24, -3
  %10 = zext i2 %indvars.iv27 to i64
  %11 = add nuw nsw i64 %10, 4294967295
  %12 = and i64 %11, 4294967295
  %13 = add nuw nsw i64 %12, 1
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %14 = trunc i64 %indvars.iv.next25 to i32
  %xtraiter = and i32 %14, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader..prol.preheader_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv24, i64 %indvars.iv.prol
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %1
  store double %17, double* %15, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !1

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %13, %.prol.loopexit.loopexit ]
  %18 = icmp ult i64 %indvars.iv24, 3
  br i1 %18, label %.lr.ph5.split.preheader, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %19 = sub i64 %9, %indvars.iv.unr
  %20 = lshr i64 %19, 2
  %21 = and i64 %20, 1
  %lcmp.mod2 = icmp eq i64 %21, 0
  br i1 %lcmp.mod2, label %.lr.ph.new.prol, label %.lr.ph.new.prol.loopexit

.lr.ph.new.prol:                                  ; preds = %.lr.ph.new.preheader
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv24, i64 %indvars.iv.unr
  %23 = bitcast double* %22 to <2 x double>*
  %24 = load <2 x double>, <2 x double>* %23, align 8
  %25 = fmul <2 x double> %24, %6
  %26 = bitcast double* %22 to <2 x double>*
  store <2 x double> %25, <2 x double>* %26, align 8
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv24, i64 %indvars.iv.next.1.prol
  %28 = bitcast double* %27 to <2 x double>*
  %29 = load <2 x double>, <2 x double>* %28, align 8
  %30 = fmul <2 x double> %29, %8
  %31 = bitcast double* %27 to <2 x double>*
  store <2 x double> %30, <2 x double>* %31, align 8
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %.lr.ph.new.prol.loopexit

.lr.ph.new.prol.loopexit:                         ; preds = %.lr.ph.new.prol, %.lr.ph.new.preheader
  %indvars.iv.unr4.ph = phi i64 [ %indvars.iv.next.3.prol, %.lr.ph.new.prol ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %32 = icmp eq i64 %20, 0
  br i1 %32, label %.lr.ph5.split.preheader, label %.lr.ph.new.preheader.new

.lr.ph.new.preheader.new:                         ; preds = %.lr.ph.new.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.lr.ph.new.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr4.ph, %.lr.ph.new.preheader.new ], [ %indvars.iv.next.3.1, %.lr.ph.new ]
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv24, i64 %indvars.iv
  %34 = bitcast double* %33 to <2 x double>*
  %35 = load <2 x double>, <2 x double>* %34, align 8
  %36 = fmul <2 x double> %35, %6
  %37 = bitcast double* %33 to <2 x double>*
  store <2 x double> %36, <2 x double>* %37, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv24, i64 %indvars.iv.next.1
  %39 = bitcast double* %38 to <2 x double>*
  %40 = load <2 x double>, <2 x double>* %39, align 8
  %41 = fmul <2 x double> %40, %8
  %42 = bitcast double* %38 to <2 x double>*
  store <2 x double> %41, <2 x double>* %42, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv24, i64 %indvars.iv.next.3
  %44 = bitcast double* %43 to <2 x double>*
  %45 = load <2 x double>, <2 x double>* %44, align 8
  %46 = fmul <2 x double> %45, %6
  %47 = bitcast double* %43 to <2 x double>*
  store <2 x double> %46, <2 x double>* %47, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv24, i64 %indvars.iv.next.1.1
  %49 = bitcast double* %48 to <2 x double>*
  %50 = load <2 x double>, <2 x double>* %49, align 8
  %51 = fmul <2 x double> %50, %8
  %52 = bitcast double* %48 to <2 x double>*
  store <2 x double> %51, <2 x double>* %52, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %indvars.iv22
  br i1 %exitcond.3.1, label %.lr.ph5.split.preheader.loopexit, label %.lr.ph.new

.lr.ph5.split.preheader.loopexit:                 ; preds = %.lr.ph.new
  br label %.lr.ph5.split.preheader

.lr.ph5.split.preheader:                          ; preds = %.lr.ph5.split.preheader.loopexit, %.lr.ph.new.prol.loopexit, %.prol.loopexit
  br label %.lr.ph5.split

.lr.ph5.split:                                    ; preds = %.lr.ph5.split.preheader, %._crit_edge3
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge3 ], [ 0, %.lr.ph5.split.preheader ]
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv24, i64 %indvars.iv18
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv24, i64 %indvars.iv18
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph5.split
  %indvars.iv13 = phi i64 [ 0, %.lr.ph5.split ], [ %indvars.iv.next14, %._crit_edge ]
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv18
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %0
  %58 = load double, double* %53, align 8
  %59 = fmul double %57, %58
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv13, i64 %indvars.iv18
  %61 = load double, double* %60, align 8
  %62 = fmul double %61, %0
  %63 = load double, double* %54, align 8
  %64 = fmul double %62, %63
  %65 = fadd double %59, %64
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv24, i64 %indvars.iv13
  %67 = load double, double* %66, align 8
  %68 = fadd double %67, %65
  store double %68, double* %66, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, %indvars.iv22
  br i1 %exitcond, label %._crit_edge3, label %._crit_edge

._crit_edge3:                                     ; preds = %._crit_edge
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 1000
  br i1 %exitcond20, label %._crit_edge6, label %.lr.ph5.split

._crit_edge6:                                     ; preds = %._crit_edge3
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 1200
  br i1 %exitcond26, label %._crit_edge9, label %._crit_edge6..lr.ph_crit_edge

._crit_edge6..lr.ph_crit_edge:                    ; preds = %._crit_edge6
  %indvars.iv.next = add i2 %indvars.iv27, 1
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  br label %.lr.ph

._crit_edge9:                                     ; preds = %._crit_edge6
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly) #0 {
.lr.ph2.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %._crit_edge, %.lr.ph2.preheader
  %indvars.iv4 = phi i64 [ 0, %.lr.ph2.preheader ], [ %indvars.iv.next5, %._crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv4, 1200
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge1, %.lr.ph2
  %indvars.iv = phi i64 [ 0, %.lr.ph2 ], [ %indvars.iv.next, %._crit_edge1 ]
  %6 = add nuw nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge1

; <label>:10:                                     ; preds = %._crit_edge2
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge2, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge, label %._crit_edge2

._crit_edge:                                      ; preds = %._crit_edge1
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond6, label %._crit_edge3, label %.lr.ph2

._crit_edge3:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
