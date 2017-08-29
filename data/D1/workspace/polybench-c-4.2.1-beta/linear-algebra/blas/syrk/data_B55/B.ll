; ModuleID = 'A.ll'
source_filename = "syrk.c"
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
  %7 = bitcast i8* %5 to [1200 x double]*
  %8 = bitcast i8* %6 to [1000 x double]*
  call void @init_array(double* nonnull %3, double* nonnull %4, [1200 x double]* %7, [1000 x double]* %8)
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = load double, double* %4, align 8
  call void @kernel_syrk(double %9, double %10, [1200 x double]* %7, [1000 x double]* %8)
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
  call void @print_array([1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture) #2 {
.lr.ph8.preheader:
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.lr.ph8

.lr.ph8:                                          ; preds = %._crit_edge6, %.lr.ph8.preheader
  %indvars.iv16 = phi i64 [ 0, %.lr.ph8.preheader ], [ %indvars.iv.next17, %._crit_edge6 ]
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.lr.ph8
  %indvars.iv13 = phi i64 [ 0, %.lr.ph8 ], [ %indvars.iv.next14, %._crit_edge1 ]
  %4 = mul nuw nsw i64 %indvars.iv16, %indvars.iv13
  %5 = add nuw nsw i64 %4, 1
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 1200
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 1.200000e+03
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv16, i64 %indvars.iv13
  store double %9, double* %10, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1000
  br i1 %exitcond15, label %._crit_edge6, label %._crit_edge1

._crit_edge6:                                     ; preds = %._crit_edge1
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1200
  br i1 %exitcond18, label %.lr.ph2.preheader, label %.lr.ph8

.lr.ph2.preheader:                                ; preds = %._crit_edge6
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %.lr.ph2.preheader, %._crit_edge
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge ], [ 0, %.lr.ph2.preheader ]
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %.lr.ph2
  %indvars.iv = phi i64 [ 0, %.lr.ph2 ], [ %indvars.iv.next, %._crit_edge2 ]
  %11 = mul nuw nsw i64 %indvars.iv10, %indvars.iv
  %12 = add nuw nsw i64 %11, 2
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 1000
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 1.000000e+03
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv
  store double %16, double* %17, align 8
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
define internal void @kernel_syrk(double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly) #2 {
.lr.ph8:
  %4 = insertelement <2 x double> undef, double %1, i32 0
  %5 = shufflevector <2 x double> %4, <2 x double> undef, <2 x i32> zeroinitializer
  %6 = insertelement <2 x double> undef, double %1, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge6..lr.ph_crit_edge, %.lr.ph8
  %indvars.iv32 = phi i2 [ 1, %.lr.ph8 ], [ %indvars.iv.next, %._crit_edge6..lr.ph_crit_edge ]
  %indvars.iv28 = phi i64 [ 0, %.lr.ph8 ], [ %indvars.iv.next29, %._crit_edge6..lr.ph_crit_edge ]
  %indvars.iv26 = phi i64 [ 1, %.lr.ph8 ], [ %indvars.iv.next27, %._crit_edge6..lr.ph_crit_edge ]
  %8 = add i64 %indvars.iv28, -3
  %9 = zext i2 %indvars.iv32 to i64
  %10 = add nuw nsw i64 %9, 4294967295
  %11 = and i64 %10, 4294967295
  %12 = add nuw nsw i64 %11, 1
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %13 = trunc i64 %indvars.iv.next29 to i32
  %xtraiter = and i32 %13, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader..prol.preheader_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv.prol
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %1
  store double %16, double* %14, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !1

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %12, %.prol.loopexit.loopexit ]
  %17 = icmp ult i64 %indvars.iv28, 3
  br i1 %17, label %.lr.ph5.split.preheader, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %18 = sub i64 %8, %indvars.iv.unr
  %19 = lshr i64 %18, 2
  %20 = and i64 %19, 1
  %lcmp.mod2 = icmp eq i64 %20, 0
  br i1 %lcmp.mod2, label %.lr.ph.new.prol, label %.lr.ph.new.prol.loopexit

.lr.ph.new.prol:                                  ; preds = %.lr.ph.new.preheader
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv.unr
  %22 = bitcast double* %21 to <2 x double>*
  %23 = load <2 x double>, <2 x double>* %22, align 8
  %24 = fmul <2 x double> %23, %5
  %25 = bitcast double* %21 to <2 x double>*
  store <2 x double> %24, <2 x double>* %25, align 8
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv.next.1.prol
  %27 = bitcast double* %26 to <2 x double>*
  %28 = load <2 x double>, <2 x double>* %27, align 8
  %29 = fmul <2 x double> %28, %7
  %30 = bitcast double* %26 to <2 x double>*
  store <2 x double> %29, <2 x double>* %30, align 8
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %.lr.ph.new.prol.loopexit

.lr.ph.new.prol.loopexit:                         ; preds = %.lr.ph.new.prol, %.lr.ph.new.preheader
  %indvars.iv.unr4.ph = phi i64 [ %indvars.iv.next.3.prol, %.lr.ph.new.prol ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %31 = icmp eq i64 %19, 0
  br i1 %31, label %.lr.ph5.split.preheader, label %.lr.ph.new.preheader.new

.lr.ph.new.preheader.new:                         ; preds = %.lr.ph.new.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.lr.ph.new.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr4.ph, %.lr.ph.new.preheader.new ], [ %indvars.iv.next.3.1, %.lr.ph.new ]
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv
  %33 = bitcast double* %32 to <2 x double>*
  %34 = load <2 x double>, <2 x double>* %33, align 8
  %35 = fmul <2 x double> %34, %5
  %36 = bitcast double* %32 to <2 x double>*
  store <2 x double> %35, <2 x double>* %36, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv.next.1
  %38 = bitcast double* %37 to <2 x double>*
  %39 = load <2 x double>, <2 x double>* %38, align 8
  %40 = fmul <2 x double> %39, %7
  %41 = bitcast double* %37 to <2 x double>*
  store <2 x double> %40, <2 x double>* %41, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv.next.3
  %43 = bitcast double* %42 to <2 x double>*
  %44 = load <2 x double>, <2 x double>* %43, align 8
  %45 = fmul <2 x double> %44, %5
  %46 = bitcast double* %42 to <2 x double>*
  store <2 x double> %45, <2 x double>* %46, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv.next.1.1
  %48 = bitcast double* %47 to <2 x double>*
  %49 = load <2 x double>, <2 x double>* %48, align 8
  %50 = fmul <2 x double> %49, %7
  %51 = bitcast double* %47 to <2 x double>*
  store <2 x double> %50, <2 x double>* %51, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %indvars.iv26
  br i1 %exitcond.3.1, label %.lr.ph5.split.preheader.loopexit, label %.lr.ph.new

.lr.ph5.split.preheader.loopexit:                 ; preds = %.lr.ph.new
  br label %.lr.ph5.split.preheader

.lr.ph5.split.preheader:                          ; preds = %.lr.ph5.split.preheader.loopexit, %.lr.ph.new.prol.loopexit, %.prol.loopexit
  %xtraiter2031 = and i64 %indvars.iv.next29, 1
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv28, i64 0
  %53 = icmp eq i64 %xtraiter2031, 0
  %54 = icmp eq i64 %indvars.iv28, 0
  br label %.lr.ph5.split

.lr.ph5.split:                                    ; preds = %._crit_edge3, %.lr.ph5.split.preheader
  %indvars.iv23 = phi i64 [ 0, %.lr.ph5.split.preheader ], [ %indvars.iv.next24, %._crit_edge3 ]
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv23
  br i1 %53, label %.prol.loopexit19, label %56

; <label>:56:                                     ; preds = %.lr.ph5.split
  %57 = load double, double* %55, align 8
  %58 = fmul double %57, %0
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv23
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = load double, double* %52, align 8
  %63 = fadd double %62, %61
  store double %63, double* %52, align 8
  br label %.prol.loopexit19

.prol.loopexit19:                                 ; preds = %.lr.ph5.split, %56
  %indvars.iv13.unr.ph = phi i64 [ 1, %56 ], [ 0, %.lr.ph5.split ]
  br i1 %54, label %._crit_edge3, label %.lr.ph5.split.new.preheader

.lr.ph5.split.new.preheader:                      ; preds = %.prol.loopexit19
  br label %.lr.ph5.split.new

.lr.ph5.split.new:                                ; preds = %.lr.ph5.split.new.preheader, %.lr.ph5.split.new
  %indvars.iv13 = phi i64 [ %indvars.iv.next14.1, %.lr.ph5.split.new ], [ %indvars.iv13.unr.ph, %.lr.ph5.split.new.preheader ]
  %64 = load double, double* %55, align 8
  %65 = fmul double %64, %0
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv23
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv13
  %70 = load double, double* %69, align 8
  %71 = fadd double %70, %68
  store double %71, double* %69, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %72 = load double, double* %55, align 8
  %73 = fmul double %72, %0
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next14, i64 %indvars.iv23
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv.next14
  %78 = load double, double* %77, align 8
  %79 = fadd double %78, %76
  store double %79, double* %77, align 8
  %indvars.iv.next14.1 = add nuw nsw i64 %indvars.iv13, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next14.1, %indvars.iv26
  br i1 %exitcond.1, label %._crit_edge3.loopexit, label %.lr.ph5.split.new

._crit_edge3.loopexit:                            ; preds = %.lr.ph5.split.new
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %.prol.loopexit19
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond = icmp eq i64 %indvars.iv.next24, 1000
  br i1 %exitcond, label %._crit_edge6, label %.lr.ph5.split

._crit_edge6:                                     ; preds = %._crit_edge3
  %exitcond30 = icmp eq i64 %indvars.iv.next29, 1200
  br i1 %exitcond30, label %._crit_edge9, label %._crit_edge6..lr.ph_crit_edge

._crit_edge6..lr.ph_crit_edge:                    ; preds = %._crit_edge6
  %indvars.iv.next = add i2 %indvars.iv32, 1
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
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
