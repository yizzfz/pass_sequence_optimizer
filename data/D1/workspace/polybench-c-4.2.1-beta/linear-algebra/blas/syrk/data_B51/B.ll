; ModuleID = 'A.ll'
source_filename = "syrk.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = bitcast i8* %5 to [1200 x double]*
  %8 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %7, [1000 x double]* %8)
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = load double, double* %4, align 8
  call fastcc void @kernel_syrk(i32 1200, i32 1000, double %9, double %10, [1200 x double]* %7, [1000 x double]* %8)
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
  call fastcc void @print_array(i32 1200, [1200 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader2.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %._crit_edge5.us, %.preheader2.lr.ph
  %indvars.iv15 = phi i64 [ 0, %.preheader2.lr.ph ], [ %indvars.iv.next16, %._crit_edge5.us ]
  br label %6

; <label>:6:                                      ; preds = %6, %.preheader2.us
  %indvars.iv11 = phi i64 [ 0, %.preheader2.us ], [ %indvars.iv.next12, %6 ]
  %7 = mul nuw nsw i64 %indvars.iv11, %indvars.iv15
  %8 = add nuw nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 1200
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.200000e+03
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv15, i64 %indvars.iv11
  store double %12, double* %13, align 8
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next12, 1000
  br i1 %exitcond21, label %._crit_edge5.us, label %6

._crit_edge5.us:                                  ; preds = %6
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond22, label %.preheader.us.preheader, label %.preheader2.us

.preheader.us.preheader:                          ; preds = %._crit_edge5.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %14

; <label>:14:                                     ; preds = %14, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %14 ]
  %15 = mul nuw nsw i64 %indvars.iv, %indvars.iv7
  %16 = add nuw nsw i64 %15, 2
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 1000
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 1.000000e+03
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv7, i64 %indvars.iv
  store double %20, double* %21, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond20, label %._crit_edge.us, label %14

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond, label %._crit_edge3, label %.preheader.us

._crit_edge3:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly) unnamed_addr #2 {
.preheader2.lr.ph:
  %6 = insertelement <2 x double> undef, double %3, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new, %.lr.ph.us.new.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr63.ph, %.lr.ph.us.new.preheader.new ], [ %indvars.iv.next.3.1, %.lr.ph.us.new ]
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv
  %9 = bitcast double* %8 to <2 x double>*
  %10 = load <2 x double>, <2 x double>* %9, align 8
  %11 = fmul <2 x double> %7, %10
  store <2 x double> %11, <2 x double>* %9, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv.next.1
  %13 = bitcast double* %12 to <2 x double>*
  %14 = load <2 x double>, <2 x double>* %13, align 8
  %15 = fmul <2 x double> %7, %14
  store <2 x double> %15, <2 x double>* %13, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv.next.3
  %17 = bitcast double* %16 to <2 x double>*
  %18 = load <2 x double>, <2 x double>* %17, align 8
  %19 = fmul <2 x double> %7, %18
  store <2 x double> %19, <2 x double>* %17, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv.next.1.1
  %21 = bitcast double* %20 to <2 x double>*
  %22 = load <2 x double>, <2 x double>* %21, align 8
  %23 = fmul <2 x double> %7, %22
  store <2 x double> %23, <2 x double>* %21, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %indvars.iv29
  br i1 %exitcond.3.1, label %.preheader.us6.preheader.loopexit.unr-lcssa, label %.lr.ph.us.new

.preheader.us6.preheader.loopexit.unr-lcssa:      ; preds = %.lr.ph.us.new
  br label %.preheader.us6.preheader.loopexit

.preheader.us6.preheader.loopexit:                ; preds = %.lr.ph.us.new.prol.loopexit, %.preheader.us6.preheader.loopexit.unr-lcssa
  br label %.preheader.us6.preheader

.preheader.us6.preheader:                         ; preds = %.preheader.us6.preheader.loopexit, %.prol.loopexit
  %xtraiter2251 = and i64 %indvars.iv.next32, 1
  %lcmp.mod23 = icmp eq i64 %xtraiter2251, 0
  %24 = icmp eq i64 %indvars.iv31, 0
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 0
  br label %.preheader.us6

.preheader.us6:                                   ; preds = %.preheader.us6.preheader, %._crit_edge.us8
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge.us8 ], [ 0, %.preheader.us6.preheader ]
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv31, i64 %indvars.iv25
  br i1 %lcmp.mod23, label %.prol.loopexit21, label %.prol.preheader20

.prol.preheader20:                                ; preds = %.preheader.us6
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, %2
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv25
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = load double, double* %25, align 8
  %33 = fadd double %32, %31
  store double %33, double* %25, align 8
  br label %.prol.loopexit21

.prol.loopexit21:                                 ; preds = %.prol.preheader20, %.preheader.us6
  %indvars.iv15.unr.ph = phi i64 [ 1, %.prol.preheader20 ], [ 0, %.preheader.us6 ]
  br i1 %24, label %._crit_edge.us8, label %.preheader.us6.new.preheader

.preheader.us6.new.preheader:                     ; preds = %.prol.loopexit21
  br label %.preheader.us6.new

.preheader.us6.new:                               ; preds = %.preheader.us6.new.preheader, %.preheader.us6.new
  %indvars.iv15 = phi i64 [ %indvars.iv.next16.1, %.preheader.us6.new ], [ %indvars.iv15.unr.ph, %.preheader.us6.new.preheader ]
  %34 = load double, double* %26, align 8
  %35 = fmul double %34, %2
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv15, i64 %indvars.iv25
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv15
  %40 = load double, double* %39, align 8
  %41 = fadd double %40, %38
  store double %41, double* %39, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %42 = load double, double* %26, align 8
  %43 = fmul double %42, %2
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv.next16, i64 %indvars.iv25
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv.next16
  %48 = load double, double* %47, align 8
  %49 = fadd double %48, %46
  store double %49, double* %47, align 8
  %indvars.iv.next16.1 = add nuw nsw i64 %indvars.iv15, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next16.1, %indvars.iv29
  br i1 %exitcond.1, label %._crit_edge.us8.loopexit, label %.preheader.us6.new

.lr.ph.us:                                        ; preds = %.preheader2.lr.ph, %._crit_edge4.us
  %indvars.iv52 = phi i2 [ %indvars.iv.next53, %._crit_edge4.us ], [ 1, %.preheader2.lr.ph ]
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge4.us ], [ 0, %.preheader2.lr.ph ]
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %._crit_edge4.us ], [ 1, %.preheader2.lr.ph ]
  %50 = add i64 %indvars.iv31, -3
  %51 = zext i2 %indvars.iv52 to i64
  %52 = add nuw nsw i64 %51, 4294967295
  %53 = and i64 %52, 4294967295
  %54 = add nuw nsw i64 %53, 1
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %55 = trunc i64 %indvars.iv.next32 to i32
  %xtraiter = and i32 %55, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv.prol
  %57 = load double, double* %56, align 8
  %58 = fmul double %57, %3
  store double %58, double* %56, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %54, %.prol.loopexit.loopexit ]
  %59 = icmp ult i64 %indvars.iv31, 3
  br i1 %59, label %.preheader.us6.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %60 = sub i64 %50, %indvars.iv.unr
  %61 = lshr i64 %60, 2
  %62 = and i64 %61, 1
  %lcmp.mod61 = icmp eq i64 %62, 0
  br i1 %lcmp.mod61, label %.lr.ph.us.new.prol.preheader, label %.lr.ph.us.new.prol.loopexit.unr-lcssa

.lr.ph.us.new.prol.preheader:                     ; preds = %.lr.ph.us.new.preheader
  br label %.lr.ph.us.new.prol

.lr.ph.us.new.prol:                               ; preds = %.lr.ph.us.new.prol.preheader
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv.unr
  %64 = bitcast double* %63 to <2 x double>*
  %65 = load <2 x double>, <2 x double>* %64, align 8
  %66 = fmul <2 x double> %7, %65
  store <2 x double> %66, <2 x double>* %64, align 8
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv.next.1.prol
  %68 = bitcast double* %67 to <2 x double>*
  %69 = load <2 x double>, <2 x double>* %68, align 8
  %70 = fmul <2 x double> %7, %69
  store <2 x double> %70, <2 x double>* %68, align 8
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %.lr.ph.us.new.prol.loopexit.unr-lcssa

.lr.ph.us.new.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new.prol
  %indvars.iv.unr63.ph = phi i64 [ %indvars.iv.next.3.prol, %.lr.ph.us.new.prol ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ]
  br label %.lr.ph.us.new.prol.loopexit

.lr.ph.us.new.prol.loopexit:                      ; preds = %.lr.ph.us.new.prol.loopexit.unr-lcssa
  %71 = icmp eq i64 %61, 0
  br i1 %71, label %.preheader.us6.preheader.loopexit, label %.lr.ph.us.new.preheader.new

.lr.ph.us.new.preheader.new:                      ; preds = %.lr.ph.us.new.prol.loopexit
  br label %.lr.ph.us.new

._crit_edge.us8.loopexit:                         ; preds = %.preheader.us6.new
  br label %._crit_edge.us8

._crit_edge.us8:                                  ; preds = %._crit_edge.us8.loopexit, %.prol.loopexit21
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next26, 1000
  br i1 %exitcond54, label %._crit_edge4.us, label %.preheader.us6

._crit_edge4.us:                                  ; preds = %._crit_edge.us8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %indvars.iv.next53 = add i2 %indvars.iv52, 1
  %exitcond = icmp eq i64 %indvars.iv.next32, 1200
  br i1 %exitcond, label %._crit_edge5, label %.lr.ph.us

._crit_edge5:                                     ; preds = %._crit_edge4.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge1.us, %.preheader.us.preheader
  %indvars.iv3 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next4, %._crit_edge1.us ]
  %6 = mul nsw i64 %indvars.iv3, 1200
  br label %7

; <label>:7:                                      ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %8 = add nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge.us

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %12, %7
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond7, label %._crit_edge1.us, label %7

._crit_edge1.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond, label %._crit_edge2, label %.preheader.us

._crit_edge2:                                     ; preds = %._crit_edge1.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
