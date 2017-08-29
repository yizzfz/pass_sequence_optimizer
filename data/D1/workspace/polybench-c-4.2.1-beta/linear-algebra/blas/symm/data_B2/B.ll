; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call fastcc void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader5.lr.ph, label %._crit_edge11

.preheader5.lr.ph:                                ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  br i1 %9, label %.preheader5.us.preheader, label %.preheader3.lr.ph

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %11 = zext i32 %1 to i64
  %12 = zext i32 %1 to i64
  %13 = zext i32 %0 to i64
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge14.us, %.preheader5.us.preheader
  %indvars.iv39 = phi i64 [ 0, %.preheader5.us.preheader ], [ %indvars.iv.next40, %._crit_edge14.us ]
  %14 = add i64 %indvars.iv39, %11
  %15 = trunc i64 %14 to i32
  br label %16

; <label>:16:                                     ; preds = %16, %.preheader5.us
  %indvars.iv36 = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next37, %16 ]
  %17 = add nuw nsw i64 %indvars.iv36, %indvars.iv39
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 100
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, %10
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv36
  store double %21, double* %22, align 8
  %23 = trunc i64 %indvars.iv36 to i32
  %24 = sub i32 %15, %23
  %25 = srem i32 %24, 100
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, %10
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv39, i64 %indvars.iv36
  store double %27, double* %28, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond = icmp eq i64 %indvars.iv.next37, %12
  br i1 %exitcond, label %._crit_edge14.us, label %16

._crit_edge14.us:                                 ; preds = %16
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next40, %13
  br i1 %exitcond51, label %.preheader4, label %.preheader5.us

.preheader4:                                      ; preds = %._crit_edge14.us
  %29 = icmp sgt i32 %0, 0
  br i1 %29, label %.preheader3.lr.ph, label %._crit_edge11

.preheader3.lr.ph:                                ; preds = %.preheader5.lr.ph, %.preheader4
  %30 = sitofp i32 %0 to double
  %31 = add i32 %0, 7
  %32 = add i32 %0, -2
  %33 = sext i32 %0 to i64
  %34 = trunc i32 %31 to i3
  %35 = zext i32 %0 to i64
  %wide.trip.count24.7 = zext i32 %0 to i64
  %36 = add nsw i64 %35, -8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.preheader3.lr.ph, %._crit_edge
  %indvars.iv48 = phi i3 [ %34, %.preheader3.lr.ph ], [ %indvars.iv.next49, %._crit_edge ]
  %indvars.iv46 = phi i64 [ 2, %.preheader3.lr.ph ], [ %indvars.iv.next47, %._crit_edge ]
  %indvars.iv33 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next34, %._crit_edge ]
  %indvars.iv31 = phi i64 [ 1, %.preheader3.lr.ph ], [ %indvars.iv.next32, %._crit_edge ]
  %37 = zext i3 %indvars.iv48 to i64
  %38 = add nuw nsw i64 %37, 4294967295
  %39 = and i64 %38, 4294967295
  %40 = add i64 %indvars.iv46, %39
  %41 = sub nsw i64 0, %indvars.iv33
  %42 = trunc i64 %41 to i32
  %43 = add i32 %31, %42
  %44 = trunc i64 %41 to i32
  %45 = add i32 %32, %44
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %xtraiter44 = and i64 %indvars.iv.next34, 1
  %lcmp.mod = icmp eq i64 %xtraiter44, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %46 = trunc i64 %indvars.iv33 to i32
  %47 = srem i32 %46, 100
  %48 = sitofp i32 %47 to double
  %49 = fdiv double %48, %30
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 0
  store double %49, double* %50, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %51 = icmp eq i64 %indvars.iv33, 0
  br i1 %51, label %.preheader, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.preheader.loopexit:                              ; preds = %.lr.ph.new
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.prol.loopexit
  %52 = icmp slt i64 %indvars.iv.next34, %33
  br i1 %52, label %.lr.ph9, label %._crit_edge

.lr.ph9:                                          ; preds = %.preheader
  %xtraiter27 = and i32 %43, 7
  %lcmp.mod28 = icmp eq i32 %xtraiter27, 0
  br i1 %lcmp.mod28, label %.prol.loopexit26, label %.prol.preheader25.preheader

.prol.preheader25.preheader:                      ; preds = %.lr.ph9
  br label %.prol.preheader25

.prol.preheader25:                                ; preds = %.prol.preheader25.preheader, %.prol.preheader25
  %indvars.iv22.prol = phi i64 [ %indvars.iv.next23.prol, %.prol.preheader25 ], [ %indvars.iv31, %.prol.preheader25.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader25 ], [ %xtraiter27, %.prol.preheader25.preheader ]
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv22.prol
  store double -9.990000e+02, double* %53, align 8
  %indvars.iv.next23.prol = add nuw nsw i64 %indvars.iv22.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit26.loopexit, label %.prol.preheader25, !llvm.loop !1

.prol.loopexit26.loopexit:                        ; preds = %.prol.preheader25
  br label %.prol.loopexit26

.prol.loopexit26:                                 ; preds = %.prol.loopexit26.loopexit, %.lr.ph9
  %indvars.iv22.unr = phi i64 [ %indvars.iv31, %.lr.ph9 ], [ %40, %.prol.loopexit26.loopexit ]
  %54 = icmp ult i32 %45, 7
  br i1 %54, label %._crit_edge, label %.lr.ph9.new.preheader

.lr.ph9.new.preheader:                            ; preds = %.prol.loopexit26
  %55 = sub i64 %36, %indvars.iv22.unr
  %56 = lshr i64 %55, 3
  %57 = add nuw nsw i64 %56, 1
  %min.iters.check = icmp ult i64 %57, 2
  br i1 %min.iters.check, label %.lr.ph9.new.preheader52, label %min.iters.checked

.lr.ph9.new.preheader52:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph9.new.preheader
  %indvars.iv22.ph = phi i64 [ %indvars.iv22.unr, %min.iters.checked ], [ %indvars.iv22.unr, %.lr.ph9.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph9.new

min.iters.checked:                                ; preds = %.lr.ph9.new.preheader
  %n.mod.vf = and i64 %57, 1
  %n.vec = sub nsw i64 %57, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %58 = add i64 %indvars.iv22.unr, 8
  %59 = shl nuw i64 %56, 3
  %60 = add i64 %58, %59
  %61 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %60, %61
  br i1 %cmp.zero, label %.lr.ph9.new.preheader52, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %62 = shl i64 %index, 3
  %63 = add i64 %indvars.iv22.unr, %62
  %64 = add nsw i64 %63, 7
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %64
  %66 = getelementptr double, double* %65, i64 -7
  %67 = bitcast double* %66 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %67, align 8
  %index.next = add i64 %index, 2
  %68 = icmp eq i64 %index.next, %n.vec
  br i1 %68, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph9.new.preheader52

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %69 = add nuw nsw i64 %indvars.iv, %indvars.iv33
  %70 = trunc i64 %69 to i32
  %71 = srem i32 %70, 100
  %72 = sitofp i32 %71 to double
  %73 = fdiv double %72, %30
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv
  store double %73, double* %74, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %75 = add nuw nsw i64 %indvars.iv.next, %indvars.iv33
  %76 = trunc i64 %75 to i32
  %77 = srem i32 %76, 100
  %78 = sitofp i32 %77 to double
  %79 = fdiv double %78, %30
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next
  store double %79, double* %80, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv31
  br i1 %exitcond.1, label %.preheader.loopexit, label %.lr.ph.new

.lr.ph9.new:                                      ; preds = %.lr.ph9.new.preheader52, %.lr.ph9.new
  %indvars.iv22 = phi i64 [ %indvars.iv.next23.7, %.lr.ph9.new ], [ %indvars.iv22.ph, %.lr.ph9.new.preheader52 ]
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv22
  store double -9.990000e+02, double* %81, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next23
  store double -9.990000e+02, double* %82, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next23.1
  store double -9.990000e+02, double* %83, align 8
  %indvars.iv.next23.2 = add nsw i64 %indvars.iv22, 3
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next23.2
  store double -9.990000e+02, double* %84, align 8
  %indvars.iv.next23.3 = add nsw i64 %indvars.iv22, 4
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next23.3
  store double -9.990000e+02, double* %85, align 8
  %indvars.iv.next23.4 = add nsw i64 %indvars.iv22, 5
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next23.4
  store double -9.990000e+02, double* %86, align 8
  %indvars.iv.next23.5 = add nsw i64 %indvars.iv22, 6
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next23.5
  store double -9.990000e+02, double* %87, align 8
  %indvars.iv.next23.6 = add nsw i64 %indvars.iv22, 7
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next23.6
  store double -9.990000e+02, double* %88, align 8
  %indvars.iv.next23.7 = add nsw i64 %indvars.iv22, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next23.7, %wide.trip.count24.7
  br i1 %exitcond.7, label %._crit_edge.loopexit, label %.lr.ph9.new, !llvm.loop !6

._crit_edge.loopexit:                             ; preds = %.lr.ph9.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %.prol.loopexit26, %.preheader
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %indvars.iv.next47 = add nuw i64 %indvars.iv46, 1
  %indvars.iv.next49 = add i3 %indvars.iv48, -1
  %exitcond50 = icmp eq i64 %indvars.iv.next34, %35
  br i1 %exitcond50, label %._crit_edge11.loopexit, label %.lr.ph

._crit_edge11.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %7, %.preheader4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader4.us.preheader, label %._crit_edge15

.preheader4.us.preheader:                         ; preds = %7
  %10 = zext i32 %1 to i64
  %11 = zext i32 %1 to i64
  %12 = zext i32 %0 to i64
  %13 = fmul double %2, 0.000000e+00
  %14 = add nsw i64 %11, -1
  %min.iters.check = icmp ult i32 %1, 4
  %15 = and i32 %1, 3
  %n.mod.vf = zext i32 %15 to i64
  %n.vec = sub nsw i64 %11, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert64 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat65 = shufflevector <2 x double> %broadcast.splatinsert64, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert68 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat69 = shufflevector <2 x double> %broadcast.splatinsert68, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert70 = insertelement <2 x double> undef, double %13, i32 0
  %broadcast.splat71 = shufflevector <2 x double> %broadcast.splatinsert70, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i32 %15, 0
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader, %._crit_edge11.us
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %._crit_edge11.us ], [ 0, %.preheader4.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 0
  %scevgep52 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %11
  %scevgep54 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv42, i64 0
  %scevgep56 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv42, i64 %11
  %16 = icmp sgt i64 %indvars.iv42, 0
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv42, i64 %indvars.iv42
  br i1 %16, label %.preheader.us.us.preheader, label %.preheader.us21.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader4.us
  br label %.preheader.us.us

.preheader.us21.preheader:                        ; preds = %.preheader4.us
  br i1 %min.iters.check, label %.preheader.us21.preheader72, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us21.preheader
  br i1 %cmp.zero, label %.preheader.us21.preheader72, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep56
  %bound1 = icmp ult double* %scevgep54, %scevgep52
  %found.conflict = and i1 %bound0, %bound1
  %bound059 = icmp ult double* %scevgep, %17
  %bound160 = icmp ult double* %17, %scevgep52
  %found.conflict61 = and i1 %bound059, %bound160
  %conflict.rdx = or i1 %found.conflict, %found.conflict61
  br i1 %conflict.rdx, label %.preheader.us21.preheader72, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %index
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !8, !noalias !11
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load63 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !8, !noalias !11
  %22 = fmul <2 x double> %wide.load, %broadcast.splat65
  %23 = fmul <2 x double> %wide.load63, %broadcast.splat65
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv42, i64 %index
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load66 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !14
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load67 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !14
  %28 = fmul <2 x double> %wide.load66, %broadcast.splat69
  %29 = fmul <2 x double> %wide.load67, %broadcast.splat69
  %30 = load double, double* %17, align 8, !alias.scope !15
  %31 = insertelement <2 x double> undef, double %30, i32 0
  %32 = shufflevector <2 x double> %31, <2 x double> undef, <2 x i32> zeroinitializer
  %33 = insertelement <2 x double> undef, double %30, i32 0
  %34 = shufflevector <2 x double> %33, <2 x double> undef, <2 x i32> zeroinitializer
  %35 = fmul <2 x double> %28, %32
  %36 = fmul <2 x double> %29, %34
  %37 = fadd <2 x double> %22, %35
  %38 = fadd <2 x double> %23, %36
  %39 = fadd <2 x double> %broadcast.splat71, %37
  %40 = fadd <2 x double> %broadcast.splat71, %38
  %41 = bitcast double* %18 to <2 x double>*
  store <2 x double> %39, <2 x double>* %41, align 8, !alias.scope !8, !noalias !11
  %42 = bitcast double* %20 to <2 x double>*
  store <2 x double> %40, <2 x double>* %42, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %43 = icmp eq i64 %index.next, %n.vec
  br i1 %43, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge11.us, label %.preheader.us21.preheader72

.preheader.us21.preheader72:                      ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us21.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us21.preheader ], [ %n.vec, %middle.block ]
  %44 = sub nsw i64 %11, %indvars.iv.ph
  %xtraiter = and i64 %44, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.us21.prol.loopexit.unr-lcssa, label %.preheader.us21.prol.preheader

.preheader.us21.prol.preheader:                   ; preds = %.preheader.us21.preheader72
  br label %.preheader.us21.prol

.preheader.us21.prol:                             ; preds = %.preheader.us21.prol.preheader
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %indvars.iv.ph
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %3
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv42, i64 %indvars.iv.ph
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %2
  %51 = load double, double* %17, align 8
  %52 = fmul double %50, %51
  %53 = fadd double %47, %52
  %54 = fadd double %13, %53
  store double %54, double* %45, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  br label %.preheader.us21.prol.loopexit.unr-lcssa

.preheader.us21.prol.loopexit.unr-lcssa:          ; preds = %.preheader.us21.preheader72, %.preheader.us21.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %.preheader.us21.prol ], [ %indvars.iv.ph, %.preheader.us21.preheader72 ]
  br label %.preheader.us21.prol.loopexit

.preheader.us21.prol.loopexit:                    ; preds = %.preheader.us21.prol.loopexit.unr-lcssa
  %55 = icmp eq i64 %14, %indvars.iv.ph
  br i1 %55, label %._crit_edge11.us.loopexit73, label %.preheader.us21.preheader72.new

.preheader.us21.preheader72.new:                  ; preds = %.preheader.us21.prol.loopexit
  br label %.preheader.us21

.preheader.us21:                                  ; preds = %.preheader.us21, %.preheader.us21.preheader72.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us21.preheader72.new ], [ %indvars.iv.next.1, %.preheader.us21 ]
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %indvars.iv
  %57 = load double, double* %56, align 8
  %58 = fmul double %57, %3
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv42, i64 %indvars.iv
  %60 = load double, double* %59, align 8
  %61 = fmul double %60, %2
  %62 = load double, double* %17, align 8
  %63 = fmul double %61, %62
  %64 = fadd double %58, %63
  %65 = fadd double %13, %64
  store double %65, double* %56, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %indvars.iv.next
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, %3
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv42, i64 %indvars.iv.next
  %70 = load double, double* %69, align 8
  %71 = fmul double %70, %2
  %72 = load double, double* %17, align 8
  %73 = fmul double %71, %72
  %74 = fadd double %68, %73
  %75 = fadd double %13, %74
  store double %75, double* %66, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond48.1 = icmp eq i64 %indvars.iv.next.1, %10
  br i1 %exitcond48.1, label %._crit_edge11.us.loopexit73.unr-lcssa, label %.preheader.us21, !llvm.loop !17

._crit_edge11.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge11.us

._crit_edge11.us.loopexit73.unr-lcssa:            ; preds = %.preheader.us21
  br label %._crit_edge11.us.loopexit73

._crit_edge11.us.loopexit73:                      ; preds = %.preheader.us21.prol.loopexit, %._crit_edge11.us.loopexit73.unr-lcssa
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.loopexit73, %._crit_edge11.us.loopexit, %middle.block
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next43, %12
  br i1 %exitcond49, label %._crit_edge15.loopexit, label %.preheader4.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv42, i64 %indvars.iv38
  br label %88

._crit_edge.us.us:                                ; preds = %88
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %indvars.iv38
  %78 = load double, double* %77, align 8
  %79 = fmul double %78, %3
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv42, i64 %indvars.iv38
  %81 = load double, double* %80, align 8
  %82 = fmul double %81, %2
  %83 = load double, double* %17, align 8
  %84 = fmul double %82, %83
  %85 = fadd double %79, %84
  %86 = fmul double %101, %2
  %87 = fadd double %86, %85
  store double %87, double* %77, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond = icmp eq i64 %indvars.iv.next39, %11
  br i1 %exitcond, label %._crit_edge11.us.loopexit, label %.preheader.us.us

; <label>:88:                                     ; preds = %88, %.preheader.us.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %88 ], [ 0, %.preheader.us.us ]
  %.07.us.us = phi double [ %101, %88 ], [ 0.000000e+00, %.preheader.us.us ]
  %89 = load double, double* %76, align 8
  %90 = fmul double %89, %2
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv42, i64 %indvars.iv32
  %92 = load double, double* %91, align 8
  %93 = fmul double %90, %92
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv32, i64 %indvars.iv38
  %95 = load double, double* %94, align 8
  %96 = fadd double %95, %93
  store double %96, double* %94, align 8
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv32, i64 %indvars.iv38
  %98 = load double, double* %97, align 8
  %99 = load double, double* %91, align 8
  %100 = fmul double %98, %99
  %101 = fadd double %.07.us.us, %100
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next33, %indvars.iv42
  br i1 %exitcond37, label %._crit_edge.us.us, label %88

._crit_edge15.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %11 = zext i32 %1 to i64
  %12 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %13 = mul nsw i64 %indvars.iv6, %10
  br label %14

; <label>:14:                                     ; preds = %21, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %21 ]
  %15 = add nsw i64 %indvars.iv, %13
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %14
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #5
  br label %21

; <label>:21:                                     ; preds = %19, %14
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next, %11
  br i1 %exitcond11, label %._crit_edge.us, label %14

._crit_edge.us:                                   ; preds = %21
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next7, %12
  br i1 %exitcond, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %3
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %28) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12, !13}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = !{!12}
!15 = !{!13}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
