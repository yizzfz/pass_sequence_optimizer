; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
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
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %.preheader

.preheader:                                       ; preds = %20, %4
  %indvars.iv4 = phi i64 [ 0, %4 ], [ %indvars.iv.next5, %20 ]
  %5 = trunc i64 %indvars.iv4 to i32
  %6 = sitofp i32 %5 to double
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv, %indvars.iv4
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.200000e+03
  %12 = fadd double %6, %11
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv4, i64 %indvars.iv
  store double %12, double* %13, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv4
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.200000e+03
  %18 = fadd double %6, %17
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv4, i64 %indvars.iv.next
  store double %18, double* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next5, 1400
  br i1 %exitcond, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph41, label %.preheader7

.lr.ph41:                                         ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph41.split.us.preheader, label %.lr.ph41.split.preheader

.lr.ph41.split.preheader:                         ; preds = %.lr.ph41
  %10 = add i32 %0, -1
  %xtraiter113 = and i32 %0, 3
  %lcmp.mod114 = icmp eq i32 %xtraiter113, 0
  br i1 %lcmp.mod114, label %.lr.ph41.split.prol.loopexit, label %.lr.ph41.split.prol.preheader

.lr.ph41.split.prol.preheader:                    ; preds = %.lr.ph41.split.preheader
  %11 = fdiv double 0.000000e+00, %2
  br label %.lr.ph41.split.prol

.lr.ph41.split.prol:                              ; preds = %.lr.ph41.split.prol.preheader, %.lr.ph41.split.prol
  %indvars.iv109.prol = phi i64 [ %indvars.iv.next110.prol, %.lr.ph41.split.prol ], [ 0, %.lr.ph41.split.prol.preheader ]
  %prol.iter115 = phi i32 [ %prol.iter115.sub, %.lr.ph41.split.prol ], [ %xtraiter113, %.lr.ph41.split.prol.preheader ]
  %12 = getelementptr inbounds double, double* %5, i64 %indvars.iv109.prol
  store double %11, double* %12, align 8
  %indvars.iv.next110.prol = add nuw nsw i64 %indvars.iv109.prol, 1
  %prol.iter115.sub = add i32 %prol.iter115, -1
  %prol.iter115.cmp = icmp eq i32 %prol.iter115.sub, 0
  br i1 %prol.iter115.cmp, label %.lr.ph41.split.prol.loopexit.loopexit, label %.lr.ph41.split.prol, !llvm.loop !1

.lr.ph41.split.prol.loopexit.loopexit:            ; preds = %.lr.ph41.split.prol
  br label %.lr.ph41.split.prol.loopexit

.lr.ph41.split.prol.loopexit:                     ; preds = %.lr.ph41.split.prol.loopexit.loopexit, %.lr.ph41.split.preheader
  %indvars.iv109.unr = phi i64 [ 0, %.lr.ph41.split.preheader ], [ %indvars.iv.next110.prol, %.lr.ph41.split.prol.loopexit.loopexit ]
  %13 = icmp ult i32 %10, 3
  br i1 %13, label %.lr.ph34, label %.lr.ph41.split.preheader121

.lr.ph41.split.preheader121:                      ; preds = %.lr.ph41.split.prol.loopexit
  %14 = fdiv double 0.000000e+00, %2
  %15 = fdiv double 0.000000e+00, %2
  %16 = fdiv double 0.000000e+00, %2
  %17 = fdiv double 0.000000e+00, %2
  %wide.trip.count111.3 = zext i32 %0 to i64
  %18 = add nsw i64 %wide.trip.count111.3, -4
  %19 = sub i64 %18, %indvars.iv109.unr
  %20 = lshr i64 %19, 2
  %21 = add nuw nsw i64 %20, 1
  %min.iters.check = icmp ult i64 %21, 4
  br i1 %min.iters.check, label %.lr.ph41.split.preheader140, label %min.iters.checked

.lr.ph41.split.preheader140:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph41.split.preheader121
  %indvars.iv109.ph = phi i64 [ %indvars.iv109.unr, %min.iters.checked ], [ %indvars.iv109.unr, %.lr.ph41.split.preheader121 ], [ %ind.end, %middle.block ]
  br label %.lr.ph41.split

min.iters.checked:                                ; preds = %.lr.ph41.split.preheader121
  %n.mod.vf = and i64 %21, 3
  %n.vec = sub nsw i64 %21, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %22 = shl nuw i64 %20, 2
  %23 = add i64 %indvars.iv109.unr, %22
  %24 = add i64 %23, 4
  %25 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %24, %25
  br i1 %cmp.zero, label %.lr.ph41.split.preheader140, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert128 = insertelement <2 x double> undef, double %14, i32 0
  %broadcast.splat129 = shufflevector <2 x double> %broadcast.splatinsert128, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert130 = insertelement <2 x double> undef, double %15, i32 0
  %broadcast.splat131 = shufflevector <2 x double> %broadcast.splatinsert130, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert132 = insertelement <2 x double> undef, double %16, i32 0
  %broadcast.splat133 = shufflevector <2 x double> %broadcast.splatinsert132, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert134 = insertelement <2 x double> undef, double %17, i32 0
  %broadcast.splat135 = shufflevector <2 x double> %broadcast.splatinsert134, <2 x double> undef, <2 x i32> zeroinitializer
  %26 = shufflevector <2 x double> %broadcast.splat129, <2 x double> %broadcast.splat131, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %27 = shufflevector <2 x double> %broadcast.splat133, <2 x double> %broadcast.splat135, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %26, <4 x double> %27, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %28 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv109.unr, %28
  %29 = add i64 %indvars.iv109.unr, %28
  %30 = add nsw i64 %29, 3
  %31 = add i64 %offset.idx, 11
  %32 = getelementptr inbounds double, double* %5, i64 %30
  %33 = getelementptr inbounds double, double* %5, i64 %31
  %34 = getelementptr double, double* %32, i64 -3
  %35 = bitcast double* %34 to <8 x double>*
  %36 = getelementptr double, double* %33, i64 -3
  %37 = bitcast double* %36 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %35, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %37, align 8
  %index.next = add i64 %index, 4
  %38 = icmp eq i64 %index.next, %n.vec
  br i1 %38, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader8, label %.lr.ph41.split.preheader140

.lr.ph41.split.us.preheader:                      ; preds = %.lr.ph41
  %39 = add i32 %1, -1
  %xtraiter102 = and i32 %1, 3
  %lcmp.mod103 = icmp eq i32 %xtraiter102, 0
  %40 = icmp ult i32 %39, 3
  %wide.trip.count107 = zext i32 %0 to i64
  %wide.trip.count98.3 = zext i32 %1 to i64
  br label %.lr.ph41.split.us

.lr.ph41.split.us:                                ; preds = %._crit_edge38.us, %.lr.ph41.split.us.preheader
  %indvars.iv105 = phi i64 [ 0, %.lr.ph41.split.us.preheader ], [ %indvars.iv.next106, %._crit_edge38.us ]
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv105
  store double 0.000000e+00, double* %41, align 8
  br i1 %lcmp.mod103, label %.prol.loopexit101, label %.prol.preheader100.preheader

.prol.preheader100.preheader:                     ; preds = %.lr.ph41.split.us
  br label %.prol.preheader100

.prol.preheader100:                               ; preds = %.prol.preheader100.preheader, %.prol.preheader100
  %indvars.iv96.prol = phi i64 [ %indvars.iv.next97.prol, %.prol.preheader100 ], [ 0, %.prol.preheader100.preheader ]
  %prol.iter104 = phi i32 [ %prol.iter104.sub, %.prol.preheader100 ], [ %xtraiter102, %.prol.preheader100.preheader ]
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv96.prol, i64 %indvars.iv105
  %43 = load double, double* %42, align 8
  %44 = load double, double* %41, align 8
  %45 = fadd double %43, %44
  store double %45, double* %41, align 8
  %indvars.iv.next97.prol = add nuw nsw i64 %indvars.iv96.prol, 1
  %prol.iter104.sub = add i32 %prol.iter104, -1
  %prol.iter104.cmp = icmp eq i32 %prol.iter104.sub, 0
  br i1 %prol.iter104.cmp, label %.prol.loopexit101.loopexit, label %.prol.preheader100, !llvm.loop !6

.prol.loopexit101.loopexit:                       ; preds = %.prol.preheader100
  br label %.prol.loopexit101

.prol.loopexit101:                                ; preds = %.prol.loopexit101.loopexit, %.lr.ph41.split.us
  %indvars.iv96.unr = phi i64 [ 0, %.lr.ph41.split.us ], [ %indvars.iv.next97.prol, %.prol.loopexit101.loopexit ]
  br i1 %40, label %._crit_edge38.us, label %.lr.ph41.split.us.new.preheader

.lr.ph41.split.us.new.preheader:                  ; preds = %.prol.loopexit101
  br label %.lr.ph41.split.us.new

.lr.ph41.split.us.new:                            ; preds = %.lr.ph41.split.us.new.preheader, %.lr.ph41.split.us.new
  %indvars.iv96 = phi i64 [ %indvars.iv.next97.3, %.lr.ph41.split.us.new ], [ %indvars.iv96.unr, %.lr.ph41.split.us.new.preheader ]
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv96, i64 %indvars.iv105
  %47 = load double, double* %46, align 8
  %48 = load double, double* %41, align 8
  %49 = fadd double %47, %48
  store double %49, double* %41, align 8
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next97, i64 %indvars.iv105
  %51 = load double, double* %50, align 8
  %52 = fadd double %51, %49
  store double %52, double* %41, align 8
  %indvars.iv.next97.1 = add nsw i64 %indvars.iv96, 2
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next97.1, i64 %indvars.iv105
  %54 = load double, double* %53, align 8
  %55 = fadd double %54, %52
  store double %55, double* %41, align 8
  %indvars.iv.next97.2 = add nsw i64 %indvars.iv96, 3
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next97.2, i64 %indvars.iv105
  %57 = load double, double* %56, align 8
  %58 = fadd double %57, %55
  store double %58, double* %41, align 8
  %indvars.iv.next97.3 = add nsw i64 %indvars.iv96, 4
  %exitcond99.3 = icmp eq i64 %indvars.iv.next97.3, %wide.trip.count98.3
  br i1 %exitcond99.3, label %._crit_edge38.us.loopexit, label %.lr.ph41.split.us.new

._crit_edge38.us.loopexit:                        ; preds = %.lr.ph41.split.us.new
  br label %._crit_edge38.us

._crit_edge38.us:                                 ; preds = %._crit_edge38.us.loopexit, %.prol.loopexit101
  %59 = load double, double* %41, align 8
  %60 = fdiv double %59, %2
  store double %60, double* %41, align 8
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond108 = icmp eq i64 %indvars.iv.next106, %wide.trip.count107
  br i1 %exitcond108, label %.preheader8.loopexit, label %.lr.ph41.split.us

.preheader8.loopexit:                             ; preds = %._crit_edge38.us
  br label %.preheader8

.preheader8.loopexit141:                          ; preds = %.lr.ph41.split
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader8.loopexit141, %.preheader8.loopexit, %middle.block
  %61 = icmp sgt i32 %0, 0
  br i1 %61, label %.lr.ph34, label %.preheader7

.lr.ph34:                                         ; preds = %.lr.ph41.split.prol.loopexit, %.preheader8
  %62 = icmp sgt i32 %1, 0
  br i1 %62, label %.lr.ph34.split.us.preheader, label %.lr.ph34.split.preheader

.lr.ph34.split.us.preheader:                      ; preds = %.lr.ph34
  %xtraiter84 = and i32 %1, 1
  %lcmp.mod85 = icmp eq i32 %xtraiter84, 0
  %63 = icmp eq i32 %1, 1
  %wide.trip.count88 = zext i32 %0 to i64
  %wide.trip.count80.1 = zext i32 %1 to i64
  br label %.lr.ph34.split.us

.lr.ph34.split.preheader:                         ; preds = %.lr.ph34
  %xtraiter94 = and i32 %0, 1
  %lcmp.mod95 = icmp eq i32 %xtraiter94, 0
  br i1 %lcmp.mod95, label %.lr.ph34.split.prol.loopexit, label %.lr.ph34.split.prol

.lr.ph34.split.prol:                              ; preds = %.lr.ph34.split.preheader
  %64 = fdiv double 0.000000e+00, %2
  store double %64, double* %6, align 8
  %65 = tail call double @sqrt(double %64) #4
  %66 = fcmp ugt double %65, 1.000000e-01
  %67 = select i1 %66, double %65, double 1.000000e+00
  store double %67, double* %6, align 8
  br label %.lr.ph34.split.prol.loopexit

.lr.ph34.split.prol.loopexit:                     ; preds = %.lr.ph34.split.preheader, %.lr.ph34.split.prol
  %indvars.iv90.unr = phi i64 [ 0, %.lr.ph34.split.preheader ], [ 1, %.lr.ph34.split.prol ]
  %68 = icmp eq i32 %0, 1
  br i1 %68, label %.preheader7, label %.lr.ph34.split.preheader119

.lr.ph34.split.preheader119:                      ; preds = %.lr.ph34.split.prol.loopexit
  %69 = fdiv double 0.000000e+00, %2
  %70 = fdiv double 0.000000e+00, %2
  %wide.trip.count92.1 = zext i32 %0 to i64
  br label %.lr.ph34.split

.lr.ph34.split.us:                                ; preds = %.lr.ph34.split.us.preheader, %._crit_edge32.us
  %indvars.iv86 = phi i64 [ %indvars.iv.next87, %._crit_edge32.us ], [ 0, %.lr.ph34.split.us.preheader ]
  %71 = getelementptr inbounds double, double* %6, i64 %indvars.iv86
  store double 0.000000e+00, double* %71, align 8
  %72 = getelementptr inbounds double, double* %5, i64 %indvars.iv86
  br i1 %lcmp.mod85, label %.prol.loopexit83, label %.prol.preheader82

.prol.preheader82:                                ; preds = %.lr.ph34.split.us
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv86
  %74 = load double, double* %73, align 8
  %75 = load double, double* %72, align 8
  %76 = fsub double %74, %75
  %77 = fmul double %76, %76
  %78 = load double, double* %71, align 8
  %79 = fadd double %78, %77
  store double %79, double* %71, align 8
  br label %.prol.loopexit83

.prol.loopexit83:                                 ; preds = %.prol.preheader82, %.lr.ph34.split.us
  %indvars.iv78.unr.ph = phi i64 [ 1, %.prol.preheader82 ], [ 0, %.lr.ph34.split.us ]
  br i1 %63, label %._crit_edge32.us, label %.lr.ph34.split.us.new.preheader

.lr.ph34.split.us.new.preheader:                  ; preds = %.prol.loopexit83
  br label %.lr.ph34.split.us.new

.lr.ph34.split.us.new:                            ; preds = %.lr.ph34.split.us.new.preheader, %.lr.ph34.split.us.new
  %indvars.iv78 = phi i64 [ %indvars.iv.next79.1, %.lr.ph34.split.us.new ], [ %indvars.iv78.unr.ph, %.lr.ph34.split.us.new.preheader ]
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv78, i64 %indvars.iv86
  %81 = load double, double* %80, align 8
  %82 = load double, double* %72, align 8
  %83 = fsub double %81, %82
  %84 = fmul double %83, %83
  %85 = load double, double* %71, align 8
  %86 = fadd double %85, %84
  store double %86, double* %71, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next79, i64 %indvars.iv86
  %88 = load double, double* %87, align 8
  %89 = load double, double* %72, align 8
  %90 = fsub double %88, %89
  %91 = fmul double %90, %90
  %92 = load double, double* %71, align 8
  %93 = fadd double %92, %91
  store double %93, double* %71, align 8
  %indvars.iv.next79.1 = add nsw i64 %indvars.iv78, 2
  %exitcond81.1 = icmp eq i64 %indvars.iv.next79.1, %wide.trip.count80.1
  br i1 %exitcond81.1, label %._crit_edge32.us.loopexit, label %.lr.ph34.split.us.new

._crit_edge32.us.loopexit:                        ; preds = %.lr.ph34.split.us.new
  br label %._crit_edge32.us

._crit_edge32.us:                                 ; preds = %._crit_edge32.us.loopexit, %.prol.loopexit83
  %94 = load double, double* %71, align 8
  %95 = fdiv double %94, %2
  store double %95, double* %71, align 8
  %96 = tail call double @sqrt(double %95) #4
  %97 = fcmp ugt double %96, 1.000000e-01
  %98 = select i1 %97, double %96, double 1.000000e+00
  store double %98, double* %71, align 8
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond89 = icmp eq i64 %indvars.iv.next87, %wide.trip.count88
  br i1 %exitcond89, label %.preheader7.loopexit, label %.lr.ph34.split.us

.lr.ph41.split:                                   ; preds = %.lr.ph41.split.preheader140, %.lr.ph41.split
  %indvars.iv109 = phi i64 [ %indvars.iv.next110.3, %.lr.ph41.split ], [ %indvars.iv109.ph, %.lr.ph41.split.preheader140 ]
  %99 = getelementptr inbounds double, double* %5, i64 %indvars.iv109
  store double %14, double* %99, align 8
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %100 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next110
  store double %15, double* %100, align 8
  %indvars.iv.next110.1 = add nsw i64 %indvars.iv109, 2
  %101 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next110.1
  store double %16, double* %101, align 8
  %indvars.iv.next110.2 = add nsw i64 %indvars.iv109, 3
  %102 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next110.2
  store double %17, double* %102, align 8
  %indvars.iv.next110.3 = add nsw i64 %indvars.iv109, 4
  %exitcond112.3 = icmp eq i64 %indvars.iv.next110.3, %wide.trip.count111.3
  br i1 %exitcond112.3, label %.preheader8.loopexit141, label %.lr.ph41.split, !llvm.loop !7

.preheader7.loopexit:                             ; preds = %._crit_edge32.us
  br label %.preheader7

.preheader7.loopexit139:                          ; preds = %.lr.ph34.split
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit139, %.preheader7.loopexit, %7, %.lr.ph34.split.prol.loopexit, %.preheader8
  %103 = icmp sgt i32 %1, 0
  br i1 %103, label %.preheader6.lr.ph, label %.preheader

.preheader6.lr.ph:                                ; preds = %.preheader7
  %104 = icmp sgt i32 %0, 0
  br i1 %104, label %.preheader6.us.preheader, label %.preheader.thread

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  %wide.trip.count71 = zext i32 %0 to i64
  %wide.trip.count75 = zext i32 %1 to i64
  br label %.preheader6.us

.preheader.thread:                                ; preds = %.preheader6.lr.ph
  %105 = add nsw i32 %0, -1
  br label %._crit_edge17

.preheader6.us:                                   ; preds = %.preheader6.us.preheader, %._crit_edge27.us
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %._crit_edge27.us ], [ 0, %.preheader6.us.preheader ]
  br label %106

; <label>:106:                                    ; preds = %106, %.preheader6.us
  %indvars.iv69 = phi i64 [ 0, %.preheader6.us ], [ %indvars.iv.next70, %106 ]
  %107 = getelementptr inbounds double, double* %5, i64 %indvars.iv69
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv73, i64 %indvars.iv69
  %110 = load double, double* %109, align 8
  %111 = fsub double %110, %108
  store double %111, double* %109, align 8
  %112 = tail call double @sqrt(double %2) #4
  %113 = getelementptr inbounds double, double* %6, i64 %indvars.iv69
  %114 = load double, double* %113, align 8
  %115 = fmul double %112, %114
  %116 = load double, double* %109, align 8
  %117 = fdiv double %116, %115
  store double %117, double* %109, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next70, %wide.trip.count71
  br i1 %exitcond72, label %._crit_edge27.us, label %106

._crit_edge27.us:                                 ; preds = %106
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next74, %wide.trip.count75
  br i1 %exitcond76, label %.preheader.loopexit, label %.preheader6.us

.lr.ph34.split:                                   ; preds = %.lr.ph34.split.preheader119, %.lr.ph34.split
  %indvars.iv90 = phi i64 [ %indvars.iv.next91.1, %.lr.ph34.split ], [ %indvars.iv90.unr, %.lr.ph34.split.preheader119 ]
  %118 = getelementptr inbounds double, double* %6, i64 %indvars.iv90
  store double %69, double* %118, align 8
  %119 = tail call double @sqrt(double %69) #4
  %120 = fcmp ugt double %119, 1.000000e-01
  %121 = select i1 %120, double %119, double 1.000000e+00
  store double %121, double* %118, align 8
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %122 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next91
  store double %70, double* %122, align 8
  %123 = tail call double @sqrt(double %70) #4
  %124 = fcmp ugt double %123, 1.000000e-01
  %125 = select i1 %124, double %123, double 1.000000e+00
  store double %125, double* %122, align 8
  %indvars.iv.next91.1 = add nsw i64 %indvars.iv90, 2
  %exitcond93.1 = icmp eq i64 %indvars.iv.next91.1, %wide.trip.count92.1
  br i1 %exitcond93.1, label %.preheader7.loopexit139, label %.lr.ph34.split

.preheader.loopexit:                              ; preds = %._crit_edge27.us
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.preheader7
  %126 = add nsw i32 %0, -1
  %127 = icmp sgt i32 %0, 1
  br i1 %127, label %.lr.ph16, label %._crit_edge17

.lr.ph16:                                         ; preds = %.preheader
  %128 = icmp sgt i32 %1, 0
  br i1 %128, label %.lr.ph16.split.us.preheader, label %.lr.ph16.split.preheader

.lr.ph16.split.preheader:                         ; preds = %.lr.ph16
  %129 = zext i32 %126 to i64
  %130 = add i32 %0, -2
  %131 = zext i32 %130 to i64
  %132 = sext i32 %0 to i64
  %wide.trip.count60.3 = zext i32 %0 to i64
  %wide.trip.count67 = zext i32 %126 to i64
  br label %.lr.ph16.split

.lr.ph16.split.us.preheader:                      ; preds = %.lr.ph16
  %133 = sext i32 %0 to i64
  %wide.trip.count54 = zext i32 %126 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %134 = icmp eq i32 %1, 1
  %wide.trip.count50 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph16.split.us

.lr.ph16.split.us:                                ; preds = %._crit_edge14.us-lcssa.us.us, %.lr.ph16.split.us.preheader
  %indvars.iv52 = phi i64 [ 0, %.lr.ph16.split.us.preheader ], [ %indvars.iv.next53, %._crit_edge14.us-lcssa.us.us ]
  %indvars.iv46 = phi i64 [ 1, %.lr.ph16.split.us.preheader ], [ %indvars.iv.next47, %._crit_edge14.us-lcssa.us.us ]
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv52
  store double 1.000000e+00, double* %135, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %136 = icmp slt i64 %indvars.iv.next53, %133
  br i1 %136, label %.lr.ph.us.us.preheader, label %._crit_edge14.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph16.split.us
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv52
  br label %.lr.ph.us.us

._crit_edge14.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge.us.us
  br label %._crit_edge14.us-lcssa.us.us

._crit_edge14.us-lcssa.us.us:                     ; preds = %._crit_edge14.us-lcssa.us.us.loopexit, %.lr.ph16.split.us
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55, label %._crit_edge17.loopexit, label %.lr.ph16.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge.us.us ], [ %indvars.iv46, %.lr.ph.us.us.preheader ]
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv48
  store double 0.000000e+00, double* %138, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %139 = load double, double* %137, align 8
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv48
  %141 = load double, double* %140, align 8
  %142 = fmul double %139, %141
  %143 = load double, double* %138, align 8
  %144 = fadd double %143, %142
  store double %144, double* %138, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %134, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %145 = bitcast double* %138 to i64*
  %146 = load i64, i64* %145, align 8
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv48, i64 %indvars.iv52
  %148 = bitcast double* %147 to i64*
  store i64 %146, i64* %148, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond = icmp eq i64 %indvars.iv.next49, %wide.trip.count50
  br i1 %exitcond, label %._crit_edge14.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv52
  %150 = load double, double* %149, align 8
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv48
  %152 = load double, double* %151, align 8
  %153 = fmul double %150, %152
  %154 = load double, double* %138, align 8
  %155 = fadd double %154, %153
  store double %155, double* %138, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv52
  %157 = load double, double* %156, align 8
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv48
  %159 = load double, double* %158, align 8
  %160 = fmul double %157, %159
  %161 = load double, double* %138, align 8
  %162 = fadd double %161, %160
  store double %162, double* %138, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph16.split:                                   ; preds = %._crit_edge14, %.lr.ph16.split.preheader
  %indvars.iv65 = phi i64 [ 0, %.lr.ph16.split.preheader ], [ %indvars.iv.next66, %._crit_edge14 ]
  %indvars.iv56 = phi i64 [ 1, %.lr.ph16.split.preheader ], [ %indvars.iv.next57, %._crit_edge14 ]
  %163 = sub i64 %131, %indvars.iv65
  %164 = trunc i64 %163 to i32
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv65
  store double 1.000000e+00, double* %165, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %166 = icmp slt i64 %indvars.iv.next66, %132
  br i1 %166, label %.lr.ph13.split.preheader, label %._crit_edge14

.lr.ph13.split.preheader:                         ; preds = %.lr.ph16.split
  %167 = sub i64 %129, %indvars.iv65
  %168 = trunc i64 %167 to i32
  %xtraiter63 = and i32 %168, 3
  %lcmp.mod64 = icmp eq i32 %xtraiter63, 0
  br i1 %lcmp.mod64, label %.lr.ph13.split.prol.loopexit, label %.lr.ph13.split.prol.preheader

.lr.ph13.split.prol.preheader:                    ; preds = %.lr.ph13.split.preheader
  br label %.lr.ph13.split.prol

.lr.ph13.split.prol:                              ; preds = %.lr.ph13.split.prol.preheader, %.lr.ph13.split.prol
  %indvars.iv58.prol = phi i64 [ %indvars.iv.next59.prol, %.lr.ph13.split.prol ], [ %indvars.iv56, %.lr.ph13.split.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph13.split.prol ], [ %xtraiter63, %.lr.ph13.split.prol.preheader ]
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv58.prol
  store double 0.000000e+00, double* %169, align 8
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58.prol, i64 %indvars.iv65
  %171 = bitcast double* %170 to i64*
  store i64 0, i64* %171, align 8
  %indvars.iv.next59.prol = add nuw nsw i64 %indvars.iv58.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph13.split.prol.loopexit.loopexit, label %.lr.ph13.split.prol, !llvm.loop !9

.lr.ph13.split.prol.loopexit.loopexit:            ; preds = %.lr.ph13.split.prol
  br label %.lr.ph13.split.prol.loopexit

.lr.ph13.split.prol.loopexit:                     ; preds = %.lr.ph13.split.prol.loopexit.loopexit, %.lr.ph13.split.preheader
  %indvars.iv58.unr = phi i64 [ %indvars.iv56, %.lr.ph13.split.preheader ], [ %indvars.iv.next59.prol, %.lr.ph13.split.prol.loopexit.loopexit ]
  %172 = icmp ult i32 %164, 3
  br i1 %172, label %._crit_edge14, label %.lr.ph13.split.preheader137

.lr.ph13.split.preheader137:                      ; preds = %.lr.ph13.split.prol.loopexit
  br label %.lr.ph13.split

.lr.ph13.split:                                   ; preds = %.lr.ph13.split.preheader137, %.lr.ph13.split
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.3, %.lr.ph13.split ], [ %indvars.iv58.unr, %.lr.ph13.split.preheader137 ]
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv58
  store double 0.000000e+00, double* %173, align 8
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv65
  %175 = bitcast double* %174 to i64*
  store i64 0, i64* %175, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next59
  store double 0.000000e+00, double* %176, align 8
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next59, i64 %indvars.iv65
  %178 = bitcast double* %177 to i64*
  store i64 0, i64* %178, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next59.1
  store double 0.000000e+00, double* %179, align 8
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next59.1, i64 %indvars.iv65
  %181 = bitcast double* %180 to i64*
  store i64 0, i64* %181, align 8
  %indvars.iv.next59.2 = add nsw i64 %indvars.iv58, 3
  %182 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next59.2
  store double 0.000000e+00, double* %182, align 8
  %183 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next59.2, i64 %indvars.iv65
  %184 = bitcast double* %183 to i64*
  store i64 0, i64* %184, align 8
  %indvars.iv.next59.3 = add nsw i64 %indvars.iv58, 4
  %exitcond61.3 = icmp eq i64 %indvars.iv.next59.3, %wide.trip.count60.3
  br i1 %exitcond61.3, label %._crit_edge14.loopexit, label %.lr.ph13.split

._crit_edge14.loopexit:                           ; preds = %.lr.ph13.split
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %.lr.ph13.split.prol.loopexit, %.lr.ph16.split
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, %wide.trip.count67
  br i1 %exitcond68, label %._crit_edge17.loopexit138, label %.lr.ph16.split

._crit_edge17.loopexit:                           ; preds = %._crit_edge14.us-lcssa.us.us
  br label %._crit_edge17

._crit_edge17.loopexit138:                        ; preds = %._crit_edge14
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit138, %._crit_edge17.loopexit, %.preheader.thread, %.preheader
  %185 = phi i32 [ %105, %.preheader.thread ], [ %126, %.preheader ], [ %126, %._crit_edge17.loopexit ], [ %126, %._crit_edge17.loopexit138 ]
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %186, i64 %186
  store double 1.000000e+00, double* %187, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count7 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv5, %8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count7
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !8, !4, !5}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
!9 = distinct !{!9, !2}
