; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
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
  tail call void @print_array(i32 1200, [1200 x double]* %10)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double* nocapture, [1200 x double]* nocapture) #2 {
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
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next5, 1400
  br i1 %exitcond, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph41, label %.preheader13

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
  %12 = add nsw i32 %xtraiter113, -1
  %13 = zext i32 %12 to i64
  br label %.lr.ph41.split.prol

.lr.ph41.split.prol:                              ; preds = %.lr.ph41.split.prol.preheader, %.lr.ph41.split.prol
  %indvars.iv109.prol = phi i64 [ %indvars.iv.next110.prol, %.lr.ph41.split.prol ], [ 0, %.lr.ph41.split.prol.preheader ]
  %prol.iter115 = phi i32 [ %prol.iter115.sub, %.lr.ph41.split.prol ], [ %xtraiter113, %.lr.ph41.split.prol.preheader ]
  %14 = getelementptr inbounds double, double* %5, i64 %indvars.iv109.prol
  store double %11, double* %14, align 8
  %indvars.iv.next110.prol = add nuw nsw i64 %indvars.iv109.prol, 1
  %prol.iter115.sub = add nsw i32 %prol.iter115, -1
  %prol.iter115.cmp = icmp eq i32 %prol.iter115.sub, 0
  br i1 %prol.iter115.cmp, label %.lr.ph41.split.prol.loopexit.loopexit, label %.lr.ph41.split.prol, !llvm.loop !1

.lr.ph41.split.prol.loopexit.loopexit:            ; preds = %.lr.ph41.split.prol
  %15 = add nuw nsw i64 %13, 1
  br label %.lr.ph41.split.prol.loopexit

.lr.ph41.split.prol.loopexit:                     ; preds = %.lr.ph41.split.prol.loopexit.loopexit, %.lr.ph41.split.preheader
  %indvars.iv109.unr = phi i64 [ 0, %.lr.ph41.split.preheader ], [ %15, %.lr.ph41.split.prol.loopexit.loopexit ]
  %16 = icmp ult i32 %10, 3
  br i1 %16, label %.lr.ph34, label %.lr.ph41.split.preheader121

.lr.ph41.split.preheader121:                      ; preds = %.lr.ph41.split.prol.loopexit
  %17 = fdiv double 0.000000e+00, %2
  %wide.trip.count111.3 = zext i32 %0 to i64
  %18 = add nsw i64 %wide.trip.count111.3, -4
  %19 = sub nsw i64 %18, %indvars.iv109.unr
  %20 = lshr i64 %19, 2
  %21 = add nuw nsw i64 %20, 1
  %min.iters.check = icmp ult i64 %21, 4
  br i1 %min.iters.check, label %.lr.ph41.split.preheader137, label %min.iters.checked

.lr.ph41.split.preheader137:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph41.split.preheader121
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
  br i1 %cmp.zero, label %.lr.ph41.split.preheader137, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert131 = insertelement <2 x double> undef, double %17, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert131, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %26 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv109.unr, %26
  %27 = add i64 %indvars.iv109.unr, %26
  %28 = add nsw i64 %27, 3
  %29 = add i64 %offset.idx, 11
  %30 = getelementptr inbounds double, double* %5, i64 %28
  %31 = getelementptr inbounds double, double* %5, i64 %29
  %32 = getelementptr double, double* %30, i64 -3
  %33 = bitcast double* %32 to <8 x double>*
  %34 = getelementptr double, double* %31, i64 -3
  %35 = bitcast double* %34 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %33, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %35, align 8
  %index.next = add i64 %index, 4
  %36 = icmp eq i64 %index.next, %n.vec
  br i1 %36, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.lr.ph34, label %.lr.ph41.split.preheader137

.lr.ph41.split.us.preheader:                      ; preds = %.lr.ph41
  %37 = add i32 %1, -1
  %xtraiter102 = and i32 %1, 3
  %lcmp.mod103 = icmp eq i32 %xtraiter102, 0
  %38 = icmp ult i32 %37, 3
  %wide.trip.count107 = zext i32 %0 to i64
  %wide.trip.count98.3 = zext i32 %1 to i64
  %39 = add nsw i32 %xtraiter102, -1
  %40 = zext i32 %39 to i64
  %41 = add nuw nsw i64 %40, 1
  br label %.lr.ph41.split.us

.lr.ph41.split.us:                                ; preds = %._crit_edge38.us, %.lr.ph41.split.us.preheader
  %indvars.iv105 = phi i64 [ 0, %.lr.ph41.split.us.preheader ], [ %indvars.iv.next106, %._crit_edge38.us ]
  %42 = getelementptr inbounds double, double* %5, i64 %indvars.iv105
  store double 0.000000e+00, double* %42, align 8
  br i1 %lcmp.mod103, label %.prol.loopexit101, label %.prol.preheader100.preheader

.prol.preheader100.preheader:                     ; preds = %.lr.ph41.split.us
  br label %.prol.preheader100

.prol.preheader100:                               ; preds = %.prol.preheader100.preheader, %.prol.preheader100
  %43 = phi double [ %46, %.prol.preheader100 ], [ 0.000000e+00, %.prol.preheader100.preheader ]
  %indvars.iv96.prol = phi i64 [ %indvars.iv.next97.prol, %.prol.preheader100 ], [ 0, %.prol.preheader100.preheader ]
  %prol.iter104 = phi i32 [ %prol.iter104.sub, %.prol.preheader100 ], [ %xtraiter102, %.prol.preheader100.preheader ]
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv96.prol, i64 %indvars.iv105
  %45 = load double, double* %44, align 8
  %46 = fadd double %45, %43
  store double %46, double* %42, align 8
  %indvars.iv.next97.prol = add nuw nsw i64 %indvars.iv96.prol, 1
  %prol.iter104.sub = add nsw i32 %prol.iter104, -1
  %prol.iter104.cmp = icmp eq i32 %prol.iter104.sub, 0
  br i1 %prol.iter104.cmp, label %.prol.loopexit101.loopexit, label %.prol.preheader100, !llvm.loop !6

.prol.loopexit101.loopexit:                       ; preds = %.prol.preheader100
  br label %.prol.loopexit101

.prol.loopexit101:                                ; preds = %.prol.loopexit101.loopexit, %.lr.ph41.split.us
  %47 = phi double [ 0.000000e+00, %.lr.ph41.split.us ], [ %46, %.prol.loopexit101.loopexit ]
  %indvars.iv96.unr = phi i64 [ 0, %.lr.ph41.split.us ], [ %41, %.prol.loopexit101.loopexit ]
  br i1 %38, label %._crit_edge38.us, label %.lr.ph41.split.us.new.preheader

.lr.ph41.split.us.new.preheader:                  ; preds = %.prol.loopexit101
  br label %.lr.ph41.split.us.new

.lr.ph41.split.us.new:                            ; preds = %.lr.ph41.split.us.new.preheader, %.lr.ph41.split.us.new
  %48 = phi double [ %60, %.lr.ph41.split.us.new ], [ %47, %.lr.ph41.split.us.new.preheader ]
  %indvars.iv96 = phi i64 [ %indvars.iv.next97.3, %.lr.ph41.split.us.new ], [ %indvars.iv96.unr, %.lr.ph41.split.us.new.preheader ]
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv96, i64 %indvars.iv105
  %50 = load double, double* %49, align 8
  %51 = fadd double %50, %48
  store double %51, double* %42, align 8
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next97, i64 %indvars.iv105
  %53 = load double, double* %52, align 8
  %54 = fadd double %53, %51
  store double %54, double* %42, align 8
  %indvars.iv.next97.1 = add nsw i64 %indvars.iv96, 2
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next97.1, i64 %indvars.iv105
  %56 = load double, double* %55, align 8
  %57 = fadd double %56, %54
  store double %57, double* %42, align 8
  %indvars.iv.next97.2 = add nsw i64 %indvars.iv96, 3
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next97.2, i64 %indvars.iv105
  %59 = load double, double* %58, align 8
  %60 = fadd double %59, %57
  store double %60, double* %42, align 8
  %indvars.iv.next97.3 = add nsw i64 %indvars.iv96, 4
  %exitcond99.3 = icmp eq i64 %indvars.iv.next97.3, %wide.trip.count98.3
  br i1 %exitcond99.3, label %._crit_edge38.us.loopexit, label %.lr.ph41.split.us.new

._crit_edge38.us.loopexit:                        ; preds = %.lr.ph41.split.us.new
  br label %._crit_edge38.us

._crit_edge38.us:                                 ; preds = %._crit_edge38.us.loopexit, %.prol.loopexit101
  %61 = phi double [ %47, %.prol.loopexit101 ], [ %60, %._crit_edge38.us.loopexit ]
  %62 = fdiv double %61, %2
  store double %62, double* %42, align 8
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond108 = icmp eq i64 %indvars.iv.next106, %wide.trip.count107
  br i1 %exitcond108, label %.lr.ph34.loopexit, label %.lr.ph41.split.us

.lr.ph34.loopexit:                                ; preds = %._crit_edge38.us
  br label %.lr.ph34

.lr.ph34.loopexit138:                             ; preds = %.lr.ph41.split
  br label %.lr.ph34

.lr.ph34:                                         ; preds = %.lr.ph34.loopexit138, %.lr.ph34.loopexit, %middle.block, %.lr.ph41.split.prol.loopexit
  br i1 %9, label %.lr.ph34.split.us.preheader, label %.lr.ph34.split.preheader

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
  %66 = fcmp ole double %65, 1.000000e-01
  %67 = select i1 %66, double 1.000000e+00, double %65
  store double %67, double* %6, align 8
  br label %.lr.ph34.split.prol.loopexit

.lr.ph34.split.prol.loopexit:                     ; preds = %.lr.ph34.split.preheader, %.lr.ph34.split.prol
  %indvars.iv90.unr = phi i64 [ 0, %.lr.ph34.split.preheader ], [ 1, %.lr.ph34.split.prol ]
  %68 = icmp eq i32 %0, 1
  br i1 %68, label %.preheader13, label %.lr.ph34.split.preheader119

.lr.ph34.split.preheader119:                      ; preds = %.lr.ph34.split.prol.loopexit
  %69 = fdiv double 0.000000e+00, %2
  %wide.trip.count92.1 = zext i32 %0 to i64
  br label %.lr.ph34.split

.lr.ph34.split.us:                                ; preds = %.lr.ph34.split.us.preheader, %._crit_edge32.us
  %indvars.iv86 = phi i64 [ %indvars.iv.next87, %._crit_edge32.us ], [ 0, %.lr.ph34.split.us.preheader ]
  %70 = getelementptr inbounds double, double* %6, i64 %indvars.iv86
  store double 0.000000e+00, double* %70, align 8
  %71 = getelementptr inbounds double, double* %5, i64 %indvars.iv86
  br i1 %lcmp.mod85, label %.prol.loopexit83, label %.prol.preheader82

.prol.preheader82:                                ; preds = %.lr.ph34.split.us
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv86
  %73 = load double, double* %72, align 8
  %74 = load double, double* %71, align 8
  %75 = fsub double %73, %74
  %76 = fmul double %75, %75
  %77 = fadd double %76, 0.000000e+00
  store double %77, double* %70, align 8
  br label %.prol.loopexit83

.prol.loopexit83:                                 ; preds = %.prol.preheader82, %.lr.ph34.split.us
  %78 = phi double [ %77, %.prol.preheader82 ], [ 0.000000e+00, %.lr.ph34.split.us ]
  %indvars.iv78.unr.ph = phi i64 [ 1, %.prol.preheader82 ], [ 0, %.lr.ph34.split.us ]
  br i1 %63, label %._crit_edge32.us, label %.lr.ph34.split.us.new.preheader

.lr.ph34.split.us.new.preheader:                  ; preds = %.prol.loopexit83
  br label %.lr.ph34.split.us.new

.lr.ph34.split.us.new:                            ; preds = %.lr.ph34.split.us.new.preheader, %.lr.ph34.split.us.new
  %79 = phi double [ %91, %.lr.ph34.split.us.new ], [ %78, %.lr.ph34.split.us.new.preheader ]
  %indvars.iv78 = phi i64 [ %indvars.iv.next79.1, %.lr.ph34.split.us.new ], [ %indvars.iv78.unr.ph, %.lr.ph34.split.us.new.preheader ]
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv78, i64 %indvars.iv86
  %81 = load double, double* %80, align 8
  %82 = load double, double* %71, align 8
  %83 = fsub double %81, %82
  %84 = fmul double %83, %83
  %85 = fadd double %79, %84
  store double %85, double* %70, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next79, i64 %indvars.iv86
  %87 = load double, double* %86, align 8
  %88 = load double, double* %71, align 8
  %89 = fsub double %87, %88
  %90 = fmul double %89, %89
  %91 = fadd double %85, %90
  store double %91, double* %70, align 8
  %indvars.iv.next79.1 = add nuw nsw i64 %indvars.iv78, 2
  %exitcond81.1 = icmp eq i64 %indvars.iv.next79.1, %wide.trip.count80.1
  br i1 %exitcond81.1, label %._crit_edge32.us.loopexit, label %.lr.ph34.split.us.new

._crit_edge32.us.loopexit:                        ; preds = %.lr.ph34.split.us.new
  br label %._crit_edge32.us

._crit_edge32.us:                                 ; preds = %._crit_edge32.us.loopexit, %.prol.loopexit83
  %92 = phi double [ %78, %.prol.loopexit83 ], [ %91, %._crit_edge32.us.loopexit ]
  %93 = fdiv double %92, %2
  store double %93, double* %70, align 8
  %94 = tail call double @sqrt(double %93) #4
  %95 = fcmp ole double %94, 1.000000e-01
  %96 = select i1 %95, double 1.000000e+00, double %94
  store double %96, double* %70, align 8
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond89 = icmp eq i64 %indvars.iv.next87, %wide.trip.count88
  br i1 %exitcond89, label %.preheader13.loopexit, label %.lr.ph34.split.us

.lr.ph41.split:                                   ; preds = %.lr.ph41.split.preheader137, %.lr.ph41.split
  %indvars.iv109 = phi i64 [ %indvars.iv.next110.3, %.lr.ph41.split ], [ %indvars.iv109.ph, %.lr.ph41.split.preheader137 ]
  %97 = getelementptr inbounds double, double* %5, i64 %indvars.iv109
  store double %17, double* %97, align 8
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %98 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next110
  store double %17, double* %98, align 8
  %indvars.iv.next110.1 = add nsw i64 %indvars.iv109, 2
  %99 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next110.1
  store double %17, double* %99, align 8
  %indvars.iv.next110.2 = add nsw i64 %indvars.iv109, 3
  %100 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next110.2
  store double %17, double* %100, align 8
  %indvars.iv.next110.3 = add nsw i64 %indvars.iv109, 4
  %exitcond112.3 = icmp eq i64 %indvars.iv.next110.3, %wide.trip.count111.3
  br i1 %exitcond112.3, label %.lr.ph34.loopexit138, label %.lr.ph41.split, !llvm.loop !7

.preheader13.loopexit:                            ; preds = %._crit_edge32.us
  br label %.preheader13

.preheader13.loopexit136:                         ; preds = %.lr.ph34.split
  br label %.preheader13

.preheader13:                                     ; preds = %.preheader13.loopexit136, %.preheader13.loopexit, %7, %.lr.ph34.split.prol.loopexit
  %101 = icmp sgt i32 %1, 0
  br i1 %101, label %.preheader12.lr.ph, label %.preheader11

.preheader12.lr.ph:                               ; preds = %.preheader13
  br i1 %8, label %.preheader12.us.preheader, label %.preheader11.thread

.preheader12.us.preheader:                        ; preds = %.preheader12.lr.ph
  %wide.trip.count71 = zext i32 %0 to i64
  %wide.trip.count75 = zext i32 %1 to i64
  br label %.preheader12.us

.preheader11.thread:                              ; preds = %.preheader12.lr.ph
  %102 = add nsw i32 %0, -1
  br label %._crit_edge19

.preheader12.us:                                  ; preds = %.preheader12.us.preheader, %._crit_edge27.us
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %._crit_edge27.us ], [ 0, %.preheader12.us.preheader ]
  br label %103

; <label>:103:                                    ; preds = %103, %.preheader12.us
  %indvars.iv69 = phi i64 [ 0, %.preheader12.us ], [ %indvars.iv.next70, %103 ]
  %104 = getelementptr inbounds double, double* %5, i64 %indvars.iv69
  %105 = load double, double* %104, align 8
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv73, i64 %indvars.iv69
  %107 = load double, double* %106, align 8
  %108 = fsub double %107, %105
  store double %108, double* %106, align 8
  %109 = tail call double @sqrt(double %2) #4
  %110 = getelementptr inbounds double, double* %6, i64 %indvars.iv69
  %111 = load double, double* %110, align 8
  %112 = fmul double %109, %111
  %113 = load double, double* %106, align 8
  %114 = fdiv double %113, %112
  store double %114, double* %106, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next70, %wide.trip.count71
  br i1 %exitcond72, label %._crit_edge27.us, label %103

._crit_edge27.us:                                 ; preds = %103
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next74, %wide.trip.count75
  br i1 %exitcond76, label %.preheader11.loopexit, label %.preheader12.us

.lr.ph34.split:                                   ; preds = %.lr.ph34.split.preheader119, %.lr.ph34.split
  %indvars.iv90 = phi i64 [ %indvars.iv.next91.1, %.lr.ph34.split ], [ %indvars.iv90.unr, %.lr.ph34.split.preheader119 ]
  %115 = getelementptr inbounds double, double* %6, i64 %indvars.iv90
  store double %69, double* %115, align 8
  %116 = tail call double @sqrt(double %69) #4
  %117 = fcmp ole double %116, 1.000000e-01
  %118 = select i1 %117, double 1.000000e+00, double %116
  store double %118, double* %115, align 8
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %119 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next91
  store double %69, double* %119, align 8
  %120 = tail call double @sqrt(double %69) #4
  %121 = fcmp ole double %120, 1.000000e-01
  %122 = select i1 %121, double 1.000000e+00, double %120
  store double %122, double* %119, align 8
  %indvars.iv.next91.1 = add nsw i64 %indvars.iv90, 2
  %exitcond93.1 = icmp eq i64 %indvars.iv.next91.1, %wide.trip.count92.1
  br i1 %exitcond93.1, label %.preheader13.loopexit136, label %.lr.ph34.split

.preheader11.loopexit:                            ; preds = %._crit_edge27.us
  br label %.preheader11

.preheader11:                                     ; preds = %.preheader11.loopexit, %.preheader13
  %123 = add nsw i32 %0, -1
  %124 = icmp sgt i32 %0, 1
  br i1 %124, label %.preheader.lr.ph, label %._crit_edge19

.preheader.lr.ph:                                 ; preds = %.preheader11
  br i1 %101, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %125 = zext i32 %123 to i64
  %126 = add i32 %0, -2
  %127 = zext i32 %126 to i64
  %128 = sext i32 %0 to i64
  %wide.trip.count60.3 = zext i32 %0 to i64
  %129 = trunc i32 %123 to i2
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %130 = sext i32 %0 to i64
  %wide.trip.count54 = zext i32 %123 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %131 = icmp eq i32 %1, 1
  %wide.trip.count50 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge17.us-lcssa.us.us, %.preheader.us.preheader
  %indvars.iv52 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next53, %._crit_edge17.us-lcssa.us.us ]
  %indvars.iv46 = phi i64 [ 1, %.preheader.us.preheader ], [ %indvars.iv.next47, %._crit_edge17.us-lcssa.us.us ]
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv52
  store double 1.000000e+00, double* %132, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %133 = icmp slt i64 %indvars.iv.next53, %130
  br i1 %133, label %.lr.ph.us.us.preheader, label %._crit_edge17.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv52
  br label %.lr.ph.us.us

._crit_edge17.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge.us.us
  br label %._crit_edge17.us-lcssa.us.us

._crit_edge17.us-lcssa.us.us:                     ; preds = %._crit_edge17.us-lcssa.us.us.loopexit, %.preheader.us
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55, label %._crit_edge19.loopexit, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge.us.us ], [ %indvars.iv46, %.lr.ph.us.us.preheader ]
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv48
  store double 0.000000e+00, double* %135, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %136 = load double, double* %134, align 8
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv48
  %138 = load double, double* %137, align 8
  %139 = fmul double %136, %138
  %140 = fadd double %139, 0.000000e+00
  store double %140, double* %135, align 8
  %141 = bitcast double %140 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %142 = phi i64 [ %141, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %143 = phi double [ %140, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %131, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  %144 = bitcast double %160 to i64
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %145 = phi i64 [ %144, %._crit_edge.us.us.loopexit ], [ %142, %.prol.loopexit ]
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv48, i64 %indvars.iv52
  %147 = bitcast double* %146 to i64*
  store i64 %145, i64* %147, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond = icmp eq i64 %indvars.iv.next49, %wide.trip.count50
  br i1 %exitcond, label %._crit_edge17.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %148 = phi double [ %160, %.lr.ph.us.us.new ], [ %143, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv52
  %150 = load double, double* %149, align 8
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv48
  %152 = load double, double* %151, align 8
  %153 = fmul double %150, %152
  %154 = fadd double %148, %153
  store double %154, double* %135, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv52
  %156 = load double, double* %155, align 8
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv48
  %158 = load double, double* %157, align 8
  %159 = fmul double %156, %158
  %160 = fadd double %154, %159
  store double %160, double* %135, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.preheader:                                       ; preds = %._crit_edge17, %.preheader.preheader
  %indvars.iv144 = phi i2 [ %indvars.iv.next145, %._crit_edge17 ], [ %129, %.preheader.preheader ]
  %indvars.iv142 = phi i64 [ %indvars.iv.next143, %._crit_edge17 ], [ 2, %.preheader.preheader ]
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge17 ], [ 0, %.preheader.preheader ]
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %._crit_edge17 ], [ 1, %.preheader.preheader ]
  %161 = zext i2 %indvars.iv144 to i64
  %162 = add nuw nsw i64 %161, 4294967295
  %163 = and i64 %162, 4294967295
  %164 = add i64 %indvars.iv142, %163
  %165 = sub i64 %127, %indvars.iv65
  %166 = trunc i64 %165 to i32
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv65
  store double 1.000000e+00, double* %167, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %168 = icmp slt i64 %indvars.iv.next66, %128
  br i1 %168, label %.lr.ph16.split.preheader, label %._crit_edge17

.lr.ph16.split.preheader:                         ; preds = %.preheader
  %169 = sub i64 %125, %indvars.iv65
  %170 = trunc i64 %169 to i32
  %xtraiter63 = and i32 %170, 3
  %lcmp.mod64 = icmp eq i32 %xtraiter63, 0
  br i1 %lcmp.mod64, label %.lr.ph16.split.prol.loopexit, label %.lr.ph16.split.prol.preheader

.lr.ph16.split.prol.preheader:                    ; preds = %.lr.ph16.split.preheader
  br label %.lr.ph16.split.prol

.lr.ph16.split.prol:                              ; preds = %.lr.ph16.split.prol.preheader, %.lr.ph16.split.prol
  %indvars.iv58.prol = phi i64 [ %indvars.iv.next59.prol, %.lr.ph16.split.prol ], [ %indvars.iv56, %.lr.ph16.split.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph16.split.prol ], [ %xtraiter63, %.lr.ph16.split.prol.preheader ]
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv58.prol
  store double 0.000000e+00, double* %171, align 8
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58.prol, i64 %indvars.iv65
  %173 = bitcast double* %172 to i64*
  store i64 0, i64* %173, align 8
  %indvars.iv.next59.prol = add nuw nsw i64 %indvars.iv58.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph16.split.prol.loopexit.loopexit, label %.lr.ph16.split.prol, !llvm.loop !9

.lr.ph16.split.prol.loopexit.loopexit:            ; preds = %.lr.ph16.split.prol
  br label %.lr.ph16.split.prol.loopexit

.lr.ph16.split.prol.loopexit:                     ; preds = %.lr.ph16.split.prol.loopexit.loopexit, %.lr.ph16.split.preheader
  %indvars.iv58.unr = phi i64 [ %indvars.iv56, %.lr.ph16.split.preheader ], [ %164, %.lr.ph16.split.prol.loopexit.loopexit ]
  %174 = icmp ult i32 %166, 3
  br i1 %174, label %._crit_edge17, label %.lr.ph16.split.preheader134

.lr.ph16.split.preheader134:                      ; preds = %.lr.ph16.split.prol.loopexit
  br label %.lr.ph16.split

.lr.ph16.split:                                   ; preds = %.lr.ph16.split.preheader134, %.lr.ph16.split
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.3, %.lr.ph16.split ], [ %indvars.iv58.unr, %.lr.ph16.split.preheader134 ]
  %175 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv58
  store double 0.000000e+00, double* %175, align 8
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv65
  %177 = bitcast double* %176 to i64*
  store i64 0, i64* %177, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next59
  store double 0.000000e+00, double* %178, align 8
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next59, i64 %indvars.iv65
  %180 = bitcast double* %179 to i64*
  store i64 0, i64* %180, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %181 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next59.1
  store double 0.000000e+00, double* %181, align 8
  %182 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next59.1, i64 %indvars.iv65
  %183 = bitcast double* %182 to i64*
  store i64 0, i64* %183, align 8
  %indvars.iv.next59.2 = add nsw i64 %indvars.iv58, 3
  %184 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next59.2
  store double 0.000000e+00, double* %184, align 8
  %185 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next59.2, i64 %indvars.iv65
  %186 = bitcast double* %185 to i64*
  store i64 0, i64* %186, align 8
  %indvars.iv.next59.3 = add nsw i64 %indvars.iv58, 4
  %exitcond61.3 = icmp eq i64 %indvars.iv.next59.3, %wide.trip.count60.3
  br i1 %exitcond61.3, label %._crit_edge17.loopexit, label %.lr.ph16.split

._crit_edge17.loopexit:                           ; preds = %.lr.ph16.split
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %.lr.ph16.split.prol.loopexit, %.preheader
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, %125
  %indvars.iv.next143 = add nuw i64 %indvars.iv142, 1
  %indvars.iv.next145 = add i2 %indvars.iv144, -1
  br i1 %exitcond68, label %._crit_edge19.loopexit135, label %.preheader

._crit_edge19.loopexit:                           ; preds = %._crit_edge17.us-lcssa.us.us
  br label %._crit_edge19

._crit_edge19.loopexit135:                        ; preds = %._crit_edge17
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit135, %._crit_edge19.loopexit, %.preheader11.thread, %.preheader11
  %187 = phi i32 [ %102, %.preheader11.thread ], [ %123, %.preheader11 ], [ %123, %._crit_edge19.loopexit ], [ %123, %._crit_edge19.loopexit135 ]
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %188, i64 %188
  store double 1.000000e+00, double* %189, align 8
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]* nocapture readonly) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
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
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count
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
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare double @sqrt(double) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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
