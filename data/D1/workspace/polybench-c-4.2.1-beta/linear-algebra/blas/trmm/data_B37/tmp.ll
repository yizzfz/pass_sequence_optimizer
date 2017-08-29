; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  call fastcc void @kernel_trmm(double %8, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %10
  br label %._crit_edge

; <label>:13:                                     ; preds = %10
  call fastcc void @print_array([1200 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %13
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader.lr.ph:
  store double 1.500000e+00, double* %0, align 8
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge3.us..preheader.us_crit_edge, %.preheader.lr.ph
  %indvars.iv19 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next20, %._crit_edge3.us..preheader.us_crit_edge ]
  %3 = add nuw nsw i64 %indvars.iv19, 4294967295
  %4 = icmp sgt i64 %indvars.iv19, 0
  br i1 %4, label %.lr.ph.us, label %.preheader.us.._crit_edge.us_crit_edge

.preheader.us.._crit_edge.us_crit_edge:           ; preds = %.preheader.us
  br label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %.preheader.us.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %5 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv19, i64 %indvars.iv19
  store double 1.000000e+00, double* %5, align 8
  %6 = trunc i64 %indvars.iv19 to i32
  %7 = add i32 %6, 1200
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.._crit_edge.us.new_crit_edge, %._crit_edge.us
  %indvars.iv8 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next9.1, %._crit_edge.us.new.._crit_edge.us.new_crit_edge ]
  %8 = trunc i64 %indvars.iv8 to i32
  %9 = sub i32 %7, %8
  %10 = srem i32 %9, 1200
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.200000e+03
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv19, i64 %indvars.iv8
  store double %12, double* %13, align 8
  %indvars.iv.next9 = or i64 %indvars.iv8, 1
  %14 = trunc i64 %indvars.iv.next9 to i32
  %15 = sub i32 %7, %14
  %16 = srem i32 %15, 1200
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.200000e+03
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv19, i64 %indvars.iv.next9
  store double %18, double* %19, align 8
  %indvars.iv.next9.1 = add nuw nsw i64 %indvars.iv8, 2
  %exitcond.116 = icmp eq i64 %indvars.iv.next9.1, 1200
  br i1 %exitcond.116, label %._crit_edge3.us, label %._crit_edge.us.new.._crit_edge.us.new_crit_edge

._crit_edge.us.new.._crit_edge.us.new_crit_edge:  ; preds = %._crit_edge.us.new
  br label %._crit_edge.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new..lr.ph.us.new_crit_edge, %.lr.ph.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new..lr.ph.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %20 = add nuw nsw i64 %indvars.iv, %indvars.iv19
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 1000
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, 1.000000e+03
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv19, i64 %indvars.iv
  store double %24, double* %25, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %26 = add nuw nsw i64 %indvars.iv.next, %indvars.iv19
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 1000
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 1.000000e+03
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv19, i64 %indvars.iv.next
  store double %30, double* %31, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv19
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new..lr.ph.us.new_crit_edge

.lr.ph.us.new..lr.ph.us.new_crit_edge:            ; preds = %.lr.ph.us.new
  br label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %.preheader.us
  %xtraiter38 = and i64 %indvars.iv19, 1
  %lcmp.mod = icmp eq i64 %xtraiter38, 0
  br i1 %lcmp.mod, label %.lr.ph.us..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph.us..prol.loopexit_crit_edge:               ; preds = %.lr.ph.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph.us
  %32 = trunc i64 %indvars.iv19 to i32
  %33 = srem i32 %32, 1000
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, 1.000000e+03
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv19, i64 0
  store double %35, double* %36, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us..prol.loopexit_crit_edge ]
  %37 = trunc i64 %3 to i32
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.lr.ph.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  br label %._crit_edge.us

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

._crit_edge3.us:                                  ; preds = %._crit_edge.us.new
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond, label %._crit_edge4, label %._crit_edge3.us..preheader.us_crit_edge

._crit_edge3.us..preheader.us_crit_edge:          ; preds = %._crit_edge3.us
  br label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge3.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader1.us.preheader:
  %broadcast.splatinsert7 = insertelement <2 x double> undef, double %0, i32 0
  %broadcast.splat8 = shufflevector <2 x double> %broadcast.splatinsert7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %._crit_edge2.us..preheader1.us_crit_edge, %.preheader1.us.preheader
  %indvars.iv22 = phi i64 [ 0, %.preheader1.us.preheader ], [ %indvars.iv.next23, %._crit_edge2.us..preheader1.us_crit_edge ]
  %indvars.iv11 = phi i64 [ 1, %.preheader1.us.preheader ], [ %indvars.iv.next12, %._crit_edge2.us..preheader1.us_crit_edge ]
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %3 = icmp slt i64 %indvars.iv.next23, 1000
  br i1 %3, label %.preheader.us.us.preheader, label %vector.ph

.preheader.us.us.preheader:                       ; preds = %.preheader1.us
  %4 = sub nsw i64 0, %indvars.iv22
  %5 = trunc i64 %4 to i32
  %6 = and i32 %5, 1
  %lcmp.mod17 = icmp eq i32 %6, 0
  %7 = icmp eq i32 %5, -998
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv22
  %indvars.iv.next14.prol = add nuw nsw i64 %indvars.iv11, 1
  br label %.preheader.us.us

vector.ph:                                        ; preds = %.preheader1.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %offset.idx = shl i64 %index, 2
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv22, i64 %offset.idx
  %10 = bitcast double* %9 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %10, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec4 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec5 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec6 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %11 = fmul <2 x double> %strided.vec, %broadcast.splat8
  %12 = fmul <2 x double> %strided.vec4, %broadcast.splat8
  %13 = fmul <2 x double> %strided.vec5, %broadcast.splat8
  %14 = or i64 %offset.idx, 3
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv22, i64 %14
  %16 = fmul <2 x double> %strided.vec6, %broadcast.splat8
  %17 = getelementptr double, double* %15, i64 -3
  %18 = bitcast double* %17 to <8 x double>*
  %19 = shufflevector <2 x double> %11, <2 x double> %12, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %20 = shufflevector <2 x double> %13, <2 x double> %16, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %19, <4 x double> %20, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %18, align 8
  %index.next = add i64 %index, 2
  %21 = icmp eq i64 %index.next, 300
  br i1 %21, label %._crit_edge2.us.loopexit31, label %vector.body.vector.body_crit_edge, !llvm.loop !1

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

._crit_edge2.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge2.us

._crit_edge2.us.loopexit31:                       ; preds = %vector.body
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %._crit_edge2.us.loopexit31, %._crit_edge2.us.loopexit
  %exitcond25 = icmp eq i64 %indvars.iv.next23, 1000
  br i1 %exitcond25, label %._crit_edge3, label %._crit_edge2.us..preheader1.us_crit_edge

._crit_edge2.us..preheader1.us_crit_edge:         ; preds = %._crit_edge2.us
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  br label %.preheader1.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us..preheader.us.us_crit_edge, %.preheader.us.us.preheader
  %indvars.iv19 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next20, %._crit_edge.us.us..preheader.us.us_crit_edge ]
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv22, i64 %indvars.iv19
  br i1 %lcmp.mod17, label %.prol.preheader, label %.preheader.us.us..prol.loopexit_crit_edge

.preheader.us.us..prol.loopexit_crit_edge:        ; preds = %.preheader.us.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us.us
  %23 = load double, double* %8, align 8
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv19
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = load double, double* %22, align 8
  %28 = fadd double %27, %26
  store double %28, double* %22, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv13.unr.ph = phi i64 [ %indvars.iv.next14.prol, %.prol.preheader ], [ %indvars.iv11, %.preheader.us.us..prol.loopexit_crit_edge ]
  %.pre3 = load double, double* %22, align 8
  br i1 %7, label %.prol.loopexit.._crit_edge.us.us_crit_edge, label %.preheader.us.us.new.preheader

.prol.loopexit.._crit_edge.us.us_crit_edge:       ; preds = %.prol.loopexit
  br label %._crit_edge.us.us

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit.._crit_edge.us.us_crit_edge, %._crit_edge.us.us.loopexit
  %29 = phi double [ %.pre3, %.prol.loopexit.._crit_edge.us.us_crit_edge ], [ %43, %._crit_edge.us.us.loopexit ]
  %30 = fmul double %29, %0
  store double %30, double* %22, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond = icmp eq i64 %indvars.iv.next20, 1200
  br i1 %exitcond, label %._crit_edge2.us.loopexit, label %._crit_edge.us.us..preheader.us.us_crit_edge

._crit_edge.us.us..preheader.us.us_crit_edge:     ; preds = %._crit_edge.us.us
  br label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new..preheader.us.us.new_crit_edge, %.preheader.us.us.new.preheader
  %31 = phi double [ %43, %.preheader.us.us.new..preheader.us.us.new_crit_edge ], [ %.pre3, %.preheader.us.us.new.preheader ]
  %indvars.iv13 = phi i64 [ %indvars.iv.next14.1, %.preheader.us.us.new..preheader.us.us.new_crit_edge ], [ %indvars.iv13.unr.ph, %.preheader.us.us.new.preheader ]
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv22
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv19
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fadd double %31, %36
  store double %37, double* %22, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next14, i64 %indvars.iv22
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next14, i64 %indvars.iv19
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fadd double %37, %42
  store double %43, double* %22, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next14.1, 1000
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new..preheader.us.us.new_crit_edge

.preheader.us.us.new..preheader.us.us.new_crit_edge: ; preds = %.preheader.us.us.new
  br label %.preheader.us.us.new

._crit_edge3:                                     ; preds = %._crit_edge2.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv3 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next4, %._crit_edge.us..preheader.us_crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv3, 1000
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge.._crit_edge2_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.._crit_edge2_crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge2.._crit_edge_crit_edge

._crit_edge2.._crit_edge_crit_edge:               ; preds = %._crit_edge2
  br label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge2
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2.._crit_edge_crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge.._crit_edge2_crit_edge

._crit_edge.._crit_edge2_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge2

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next4, 1000
  br i1 %exitcond6, label %._crit_edge1, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge1:                                     ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
