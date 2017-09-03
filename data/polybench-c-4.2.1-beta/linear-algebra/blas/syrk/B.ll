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
  br i1 %11, label %12, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %.._crit_edge_crit_edge14

.._crit_edge_crit_edge14:                         ; preds = %12
  br label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1200, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge14, %.._crit_edge_crit_edge, %15
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader28.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader28.us

.preheader28.us:                                  ; preds = %._crit_edge35.us..preheader28.us_crit_edge, %.preheader28.lr.ph
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge35.us..preheader28.us_crit_edge ], [ 0, %.preheader28.lr.ph ]
  br label %6

; <label>:6:                                      ; preds = %._crit_edge, %.preheader28.us
  %indvars.iv43 = phi i64 [ 0, %.preheader28.us ], [ %indvars.iv.next44, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv43, %indvars.iv47
  %8 = add nuw nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 1200
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.200000e+03
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv47, i64 %indvars.iv43
  store double %12, double* %13, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, 1000
  br i1 %exitcond46, label %._crit_edge35.us, label %._crit_edge

._crit_edge:                                      ; preds = %6
  br label %6

._crit_edge35.us:                                 ; preds = %6
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next48, 1200
  br i1 %exitcond50, label %._crit_edge35.us..preheader.us_crit_edge, label %._crit_edge35.us..preheader28.us_crit_edge

._crit_edge35.us..preheader28.us_crit_edge:       ; preds = %._crit_edge35.us
  br label %.preheader28.us

._crit_edge35.us..preheader.us_crit_edge:         ; preds = %._crit_edge35.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %._crit_edge35.us..preheader.us_crit_edge
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %._crit_edge35.us..preheader.us_crit_edge ]
  br label %14

; <label>:14:                                     ; preds = %._crit_edge53, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge53 ]
  %15 = mul nuw nsw i64 %indvars.iv, %indvars.iv39
  %16 = add nuw nsw i64 %15, 2
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 1000
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 1.000000e+03
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv
  store double %20, double* %21, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge53

._crit_edge53:                                    ; preds = %14
  br label %14

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, 1200
  br i1 %exitcond42, label %._crit_edge32, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge32:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly) unnamed_addr #2 {
.preheader28.lr.ph:
  %6 = insertelement <2 x double> undef, double %3, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  %8 = insertelement <2 x double> undef, double %3, i32 0
  %9 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.prol.loopexit..lr.ph.us.new_crit_edge, %.lr.ph.us.new..lr.ph.us.new_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new..lr.ph.us.new_crit_edge ], [ %indvars.iv.unr, %.prol.loopexit..lr.ph.us.new_crit_edge ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv
  %11 = bitcast double* %10 to <2 x double>*
  %12 = load <2 x double>, <2 x double>* %11, align 8
  %13 = fmul <2 x double> %12, %7
  %14 = bitcast double* %10 to <2 x double>*
  store <2 x double> %13, <2 x double>* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next.1
  %16 = bitcast double* %15 to <2 x double>*
  %17 = load <2 x double>, <2 x double>* %16, align 8
  %18 = fmul <2 x double> %17, %9
  %19 = bitcast double* %15 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv63
  br i1 %exitcond.3, label %.lr.ph.us.new..preheader.us39.preheader_crit_edge, label %.lr.ph.us.new..lr.ph.us.new_crit_edge

.lr.ph.us.new..lr.ph.us.new_crit_edge:            ; preds = %.lr.ph.us.new
  br label %.lr.ph.us.new

.lr.ph.us.new..preheader.us39.preheader_crit_edge: ; preds = %.lr.ph.us.new
  br label %.preheader.us39.preheader

.preheader.us39.new:                              ; preds = %.prol.loopexit55..preheader.us39.new_crit_edge, %.preheader.us39.new..preheader.us39.new_crit_edge
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.1, %.preheader.us39.new..preheader.us39.new_crit_edge ], [ %indvars.iv49.unr.ph, %.prol.loopexit55..preheader.us39.new_crit_edge ]
  %20 = load double, double* %36, align 8
  %21 = fmul double %20, %2
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv49, i64 %indvars.iv59
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv49
  %26 = load double, double* %25, align 8
  %27 = fadd double %26, %24
  store double %27, double* %25, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %28 = load double, double* %36, align 8
  %29 = fmul double %28, %2
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv.next50, i64 %indvars.iv59
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next50
  %34 = load double, double* %33, align 8
  %35 = fadd double %34, %32
  store double %35, double* %33, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next50.1, %indvars.iv63
  br i1 %exitcond.1, label %.preheader.us39.new.._crit_edge.us42_crit_edge, label %.preheader.us39.new..preheader.us39.new_crit_edge

.preheader.us39.new..preheader.us39.new_crit_edge: ; preds = %.preheader.us39.new
  br label %.preheader.us39.new

.preheader.us39.new.._crit_edge.us42_crit_edge:   ; preds = %.preheader.us39.new
  br label %._crit_edge.us42

.preheader.us39:                                  ; preds = %._crit_edge.us42..preheader.us39_crit_edge, %.preheader.us39.preheader
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge.us42..preheader.us39_crit_edge ], [ 0, %.preheader.us39.preheader ]
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv65, i64 %indvars.iv59
  br i1 %lcmp.mod57, label %.preheader.us39..prol.loopexit55_crit_edge, label %37

.preheader.us39..prol.loopexit55_crit_edge:       ; preds = %.preheader.us39
  br label %.prol.loopexit55

; <label>:37:                                     ; preds = %.preheader.us39
  %38 = load double, double* %36, align 8
  %39 = fmul double %38, %2
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv59
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = load double, double* %51, align 8
  %44 = fadd double %43, %42
  store double %44, double* %51, align 8
  br label %.prol.loopexit55

.prol.loopexit55:                                 ; preds = %.preheader.us39..prol.loopexit55_crit_edge, %37
  %indvars.iv49.unr.ph = phi i64 [ 1, %37 ], [ 0, %.preheader.us39..prol.loopexit55_crit_edge ]
  br i1 %50, label %.prol.loopexit55.._crit_edge.us42_crit_edge, label %.prol.loopexit55..preheader.us39.new_crit_edge

.prol.loopexit55..preheader.us39.new_crit_edge:   ; preds = %.prol.loopexit55
  br label %.preheader.us39.new

.prol.loopexit55.._crit_edge.us42_crit_edge:      ; preds = %.prol.loopexit55
  br label %._crit_edge.us42

.lr.ph.us:                                        ; preds = %._crit_edge33.us..lr.ph.us_crit_edge, %.preheader28.lr.ph
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge33.us..lr.ph.us_crit_edge ], [ 0, %.preheader28.lr.ph ]
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge33.us..lr.ph.us_crit_edge ], [ 1, %.preheader28.lr.ph ]
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %45 = trunc i64 %indvars.iv.next66 to i32
  %xtraiter = and i32 %45, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us..prol.loopexit_crit_edge, label %.lr.ph.us..prol.preheader_crit_edge

.lr.ph.us..prol.preheader_crit_edge:              ; preds = %.lr.ph.us
  br label %.prol.preheader

.lr.ph.us..prol.loopexit_crit_edge:               ; preds = %.lr.ph.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.lr.ph.us..prol.preheader_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.lr.ph.us..prol.preheader_crit_edge ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.lr.ph.us..prol.preheader_crit_edge ]
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.prol
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %3
  store double %48, double* %46, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.preheader..prol.loopexit_crit_edge, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !1

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  br label %.prol.preheader

.prol.preheader..prol.loopexit_crit_edge:         ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader..prol.loopexit_crit_edge, %.lr.ph.us..prol.loopexit_crit_edge
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us..prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %.prol.preheader..prol.loopexit_crit_edge ]
  %49 = icmp ult i64 %indvars.iv65, 3
  br i1 %49, label %.prol.loopexit..preheader.us39.preheader_crit_edge, label %.prol.loopexit..lr.ph.us.new_crit_edge

.prol.loopexit..lr.ph.us.new_crit_edge:           ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

.prol.loopexit..preheader.us39.preheader_crit_edge: ; preds = %.prol.loopexit
  br label %.preheader.us39.preheader

.preheader.us39.preheader:                        ; preds = %.prol.loopexit..preheader.us39.preheader_crit_edge, %.lr.ph.us.new..preheader.us39.preheader_crit_edge
  %xtraiter5685 = and i64 %indvars.iv.next66, 1
  %lcmp.mod57 = icmp eq i64 %xtraiter5685, 0
  %50 = icmp eq i64 %indvars.iv65, 0
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 0
  br label %.preheader.us39

._crit_edge.us42:                                 ; preds = %.prol.loopexit55.._crit_edge.us42_crit_edge, %.preheader.us39.new.._crit_edge.us42_crit_edge
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond = icmp eq i64 %indvars.iv.next60, 1000
  br i1 %exitcond, label %._crit_edge33.us, label %._crit_edge.us42..preheader.us39_crit_edge

._crit_edge.us42..preheader.us39_crit_edge:       ; preds = %._crit_edge.us42
  br label %.preheader.us39

._crit_edge33.us:                                 ; preds = %._crit_edge.us42
  %exitcond68 = icmp eq i64 %indvars.iv.next66, 1200
  br i1 %exitcond68, label %._crit_edge37, label %._crit_edge33.us..lr.ph.us_crit_edge

._crit_edge33.us..lr.ph.us_crit_edge:             ; preds = %._crit_edge33.us
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  br label %.lr.ph.us

._crit_edge37:                                    ; preds = %._crit_edge33.us
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
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge12.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge12.us..preheader.us_crit_edge ]
  %6 = mul nsw i64 %indvars.iv15, 1200
  br label %7

; <label>:7:                                      ; preds = %._crit_edge.us._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us._crit_edge ]
  %8 = add nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %.._crit_edge.us_crit_edge

.._crit_edge.us_crit_edge:                        ; preds = %7
  br label %._crit_edge.us

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.._crit_edge.us_crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge12.us, label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us
  br label %7

._crit_edge12.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond18, label %._crit_edge14, label %._crit_edge12.us..preheader.us_crit_edge

._crit_edge12.us..preheader.us_crit_edge:         ; preds = %._crit_edge12.us
  br label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge12.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
