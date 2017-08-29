; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
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
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
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
  br label %._crit_edge

._crit_edge:                                      ; preds = %22, %4
  %indvars.iv3 = phi i64 [ 0, %4 ], [ %indvars.iv.next4, %22 ]
  %5 = trunc i64 %indvars.iv3 to i32
  %6 = sitofp i32 %5 to double
  %7 = insertelement <2 x double> undef, double %6, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %9

; <label>:9:                                      ; preds = %9, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %9 ]
  %10 = mul nuw nsw i64 %indvars.iv, %indvars.iv3
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv3
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %12, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fdiv <2 x double> %18, <double 1.200000e+03, double 1.200000e+03>
  %20 = fadd <2 x double> %8, %19
  %21 = bitcast double* %13 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %22, label %9

; <label>:22:                                     ; preds = %9
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, 1400
  br i1 %exitcond, label %23, label %._crit_edge

; <label>:23:                                     ; preds = %22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph51, label %._crit_edge16

.lr.ph51:                                         ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph51.split.us.preheader, label %.lr.ph51.split.preheader

.lr.ph51.split.preheader:                         ; preds = %.lr.ph51
  %10 = add i32 %0, -1
  %xtraiter125 = and i32 %0, 3
  %lcmp.mod126 = icmp eq i32 %xtraiter125, 0
  br i1 %lcmp.mod126, label %.lr.ph51.split.prol.loopexit, label %.lr.ph51.split.prol.preheader

.lr.ph51.split.prol.preheader:                    ; preds = %.lr.ph51.split.preheader
  %11 = fdiv double 0.000000e+00, %2
  br label %.lr.ph51.split.prol

.lr.ph51.split.prol:                              ; preds = %.lr.ph51.split.prol.preheader, %.lr.ph51.split.prol
  %indvars.iv121.prol = phi i64 [ %indvars.iv.next122.prol, %.lr.ph51.split.prol ], [ 0, %.lr.ph51.split.prol.preheader ]
  %prol.iter127 = phi i32 [ %prol.iter127.sub, %.lr.ph51.split.prol ], [ %xtraiter125, %.lr.ph51.split.prol.preheader ]
  %12 = getelementptr inbounds double, double* %5, i64 %indvars.iv121.prol
  store double %11, double* %12, align 8
  %indvars.iv.next122.prol = add nuw nsw i64 %indvars.iv121.prol, 1
  %prol.iter127.sub = add i32 %prol.iter127, -1
  %prol.iter127.cmp = icmp eq i32 %prol.iter127.sub, 0
  br i1 %prol.iter127.cmp, label %.lr.ph51.split.prol.loopexit.loopexit, label %.lr.ph51.split.prol, !llvm.loop !1

.lr.ph51.split.prol.loopexit.loopexit:            ; preds = %.lr.ph51.split.prol
  br label %.lr.ph51.split.prol.loopexit

.lr.ph51.split.prol.loopexit:                     ; preds = %.lr.ph51.split.prol.loopexit.loopexit, %.lr.ph51.split.preheader
  %indvars.iv121.unr = phi i64 [ 0, %.lr.ph51.split.preheader ], [ %indvars.iv.next122.prol, %.lr.ph51.split.prol.loopexit.loopexit ]
  %13 = icmp ult i32 %10, 3
  br i1 %13, label %.lr.ph45, label %.lr.ph51.split.preheader133

.lr.ph51.split.preheader133:                      ; preds = %.lr.ph51.split.prol.loopexit
  %14 = fdiv double 0.000000e+00, %2
  %wide.trip.count123.3 = zext i32 %0 to i64
  %15 = add nsw i64 %wide.trip.count123.3, -4
  %16 = sub i64 %15, %indvars.iv121.unr
  %17 = lshr i64 %16, 2
  %18 = add nuw nsw i64 %17, 1
  %min.iters.check = icmp ult i64 %18, 4
  br i1 %min.iters.check, label %.lr.ph51.split.preheader158, label %min.iters.checked

.lr.ph51.split.preheader158:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph51.split.preheader133
  %indvars.iv121.ph = phi i64 [ %indvars.iv121.unr, %min.iters.checked ], [ %indvars.iv121.unr, %.lr.ph51.split.preheader133 ], [ %ind.end, %middle.block ]
  br label %.lr.ph51.split

min.iters.checked:                                ; preds = %.lr.ph51.split.preheader133
  %n.mod.vf = and i64 %18, 3
  %n.vec = sub nsw i64 %18, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %19 = shl nuw i64 %17, 2
  %20 = add i64 %indvars.iv121.unr, %19
  %21 = add i64 %20, 4
  %22 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %21, %22
  br i1 %cmp.zero, label %.lr.ph51.split.preheader158, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert146 = insertelement <2 x double> undef, double %14, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert146, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %23 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv121.unr, %23
  %24 = add nsw i64 %offset.idx, 3
  %25 = add i64 %offset.idx, 11
  %26 = getelementptr inbounds double, double* %5, i64 %24
  %27 = getelementptr inbounds double, double* %5, i64 %25
  %28 = getelementptr double, double* %26, i64 -3
  %29 = bitcast double* %28 to <8 x double>*
  %30 = getelementptr double, double* %27, i64 -3
  %31 = bitcast double* %30 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %29, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %31, align 8
  %index.next = add i64 %index, 4
  %32 = icmp eq i64 %index.next, %n.vec
  br i1 %32, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph51.split.preheader158

.lr.ph51.split.us.preheader:                      ; preds = %.lr.ph51
  %33 = add i32 %1, -1
  %xtraiter113 = and i32 %1, 3
  %lcmp.mod114 = icmp eq i32 %xtraiter113, 0
  %34 = icmp ult i32 %33, 3
  %wide.trip.count119 = zext i32 %0 to i64
  %wide.trip.count109.3 = zext i32 %1 to i64
  br label %.lr.ph51.split.us

.lr.ph51.split.us:                                ; preds = %._crit_edge48.us, %.lr.ph51.split.us.preheader
  %indvars.iv117 = phi i64 [ 0, %.lr.ph51.split.us.preheader ], [ %indvars.iv.next118, %._crit_edge48.us ]
  %35 = getelementptr inbounds double, double* %5, i64 %indvars.iv117
  store double 0.000000e+00, double* %35, align 8
  br i1 %lcmp.mod114, label %.prol.loopexit112, label %.prol.preheader111.preheader

.prol.preheader111.preheader:                     ; preds = %.lr.ph51.split.us
  br label %.prol.preheader111

.prol.preheader111:                               ; preds = %.prol.preheader111.preheader, %.prol.preheader111
  %indvars.iv107.prol = phi i64 [ %indvars.iv.next108.prol, %.prol.preheader111 ], [ 0, %.prol.preheader111.preheader ]
  %36 = phi double [ %39, %.prol.preheader111 ], [ 0.000000e+00, %.prol.preheader111.preheader ]
  %prol.iter115 = phi i32 [ %prol.iter115.sub, %.prol.preheader111 ], [ %xtraiter113, %.prol.preheader111.preheader ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv107.prol, i64 %indvars.iv117
  %38 = load double, double* %37, align 8
  %39 = fadd double %36, %38
  store double %39, double* %35, align 8
  %indvars.iv.next108.prol = add nuw nsw i64 %indvars.iv107.prol, 1
  %prol.iter115.sub = add i32 %prol.iter115, -1
  %prol.iter115.cmp = icmp eq i32 %prol.iter115.sub, 0
  br i1 %prol.iter115.cmp, label %.prol.loopexit112.loopexit, label %.prol.preheader111, !llvm.loop !6

.prol.loopexit112.loopexit:                       ; preds = %.prol.preheader111
  br label %.prol.loopexit112

.prol.loopexit112:                                ; preds = %.prol.loopexit112.loopexit, %.lr.ph51.split.us
  %indvars.iv107.unr = phi i64 [ 0, %.lr.ph51.split.us ], [ %indvars.iv.next108.prol, %.prol.loopexit112.loopexit ]
  %.unr116 = phi double [ 0.000000e+00, %.lr.ph51.split.us ], [ %39, %.prol.loopexit112.loopexit ]
  %.lcssa56.unr = phi double [ undef, %.lr.ph51.split.us ], [ %39, %.prol.loopexit112.loopexit ]
  br i1 %34, label %._crit_edge48.us, label %.lr.ph51.split.us.new.preheader

.lr.ph51.split.us.new.preheader:                  ; preds = %.prol.loopexit112
  br label %.lr.ph51.split.us.new

.lr.ph51.split.us.new:                            ; preds = %.lr.ph51.split.us.new.preheader, %.lr.ph51.split.us.new
  %indvars.iv107 = phi i64 [ %indvars.iv.next108.3, %.lr.ph51.split.us.new ], [ %indvars.iv107.unr, %.lr.ph51.split.us.new.preheader ]
  %40 = phi double [ %52, %.lr.ph51.split.us.new ], [ %.unr116, %.lr.ph51.split.us.new.preheader ]
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv107, i64 %indvars.iv117
  %42 = load double, double* %41, align 8
  %43 = fadd double %40, %42
  store double %43, double* %35, align 8
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next108, i64 %indvars.iv117
  %45 = load double, double* %44, align 8
  %46 = fadd double %43, %45
  store double %46, double* %35, align 8
  %indvars.iv.next108.1 = add nsw i64 %indvars.iv107, 2
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next108.1, i64 %indvars.iv117
  %48 = load double, double* %47, align 8
  %49 = fadd double %46, %48
  store double %49, double* %35, align 8
  %indvars.iv.next108.2 = add nsw i64 %indvars.iv107, 3
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next108.2, i64 %indvars.iv117
  %51 = load double, double* %50, align 8
  %52 = fadd double %49, %51
  store double %52, double* %35, align 8
  %indvars.iv.next108.3 = add nsw i64 %indvars.iv107, 4
  %exitcond110.3 = icmp eq i64 %indvars.iv.next108.3, %wide.trip.count109.3
  br i1 %exitcond110.3, label %._crit_edge48.us.loopexit, label %.lr.ph51.split.us.new

._crit_edge48.us.loopexit:                        ; preds = %.lr.ph51.split.us.new
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %._crit_edge48.us.loopexit, %.prol.loopexit112
  %.lcssa56 = phi double [ %.lcssa56.unr, %.prol.loopexit112 ], [ %52, %._crit_edge48.us.loopexit ]
  %53 = fdiv double %.lcssa56, %2
  store double %53, double* %35, align 8
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond120 = icmp eq i64 %indvars.iv.next118, %wide.trip.count119
  br i1 %exitcond120, label %._crit_edge.loopexit, label %.lr.ph51.split.us

._crit_edge.loopexit:                             ; preds = %._crit_edge48.us
  br label %._crit_edge

._crit_edge.loopexit159:                          ; preds = %.lr.ph51.split
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit159, %._crit_edge.loopexit, %middle.block
  br i1 true, label %.lr.ph45, label %._crit_edge.._crit_edge16_crit_edge

._crit_edge.._crit_edge16_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge16

.lr.ph45:                                         ; preds = %.lr.ph51.split.prol.loopexit, %._crit_edge
  br i1 %9, label %.lr.ph45.split.us.preheader, label %.lr.ph45.split.preheader

.lr.ph45.split.us.preheader:                      ; preds = %.lr.ph45
  %xtraiter95 = and i32 %1, 1
  %lcmp.mod96 = icmp eq i32 %xtraiter95, 0
  %54 = icmp eq i32 %1, 1
  %wide.trip.count99 = zext i32 %0 to i64
  %wide.trip.count91.1 = zext i32 %1 to i64
  br label %.lr.ph45.split.us

.lr.ph45.split.preheader:                         ; preds = %.lr.ph45
  %xtraiter105 = and i32 %0, 1
  %lcmp.mod106 = icmp eq i32 %xtraiter105, 0
  br i1 %lcmp.mod106, label %.lr.ph45.split.prol.loopexit, label %.lr.ph45.split.prol

.lr.ph45.split.prol:                              ; preds = %.lr.ph45.split.preheader
  %55 = fdiv double 0.000000e+00, %2
  store double %55, double* %6, align 8
  %56 = tail call double @sqrt(double %55) #4
  %57 = fcmp ugt double %56, 1.000000e-01
  %58 = select i1 %57, double %56, double 1.000000e+00
  store double %58, double* %6, align 8
  br label %.lr.ph45.split.prol.loopexit

.lr.ph45.split.prol.loopexit:                     ; preds = %.lr.ph45.split.preheader, %.lr.ph45.split.prol
  %indvars.iv101.unr = phi i64 [ 0, %.lr.ph45.split.preheader ], [ 1, %.lr.ph45.split.prol ]
  %59 = icmp eq i32 %0, 1
  br i1 %59, label %._crit_edge16, label %.lr.ph45.split.preheader131

.lr.ph45.split.preheader131:                      ; preds = %.lr.ph45.split.prol.loopexit
  %60 = fdiv double 0.000000e+00, %2
  %wide.trip.count103.1 = zext i32 %0 to i64
  br label %.lr.ph45.split

.lr.ph45.split.us:                                ; preds = %.lr.ph45.split.us.preheader, %._crit_edge43.us
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %._crit_edge43.us ], [ 0, %.lr.ph45.split.us.preheader ]
  %61 = getelementptr inbounds double, double* %6, i64 %indvars.iv97
  store double 0.000000e+00, double* %61, align 8
  %62 = getelementptr inbounds double, double* %5, i64 %indvars.iv97
  br i1 %lcmp.mod96, label %.prol.loopexit94, label %.prol.preheader93

.prol.preheader93:                                ; preds = %.lr.ph45.split.us
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv97
  %64 = load double, double* %63, align 8
  %65 = load double, double* %62, align 8
  %66 = fsub double %64, %65
  %67 = fmul double %66, %66
  %68 = fadd double %67, 0.000000e+00
  store double %68, double* %61, align 8
  br label %.prol.loopexit94

.prol.loopexit94:                                 ; preds = %.prol.preheader93, %.lr.ph45.split.us
  %indvars.iv89.unr.ph = phi i64 [ 1, %.prol.preheader93 ], [ 0, %.lr.ph45.split.us ]
  %.unr.ph = phi double [ %68, %.prol.preheader93 ], [ 0.000000e+00, %.lr.ph45.split.us ]
  %.lcssa.unr.ph = phi double [ %68, %.prol.preheader93 ], [ undef, %.lr.ph45.split.us ]
  br i1 %54, label %._crit_edge43.us, label %.lr.ph45.split.us.new.preheader

.lr.ph45.split.us.new.preheader:                  ; preds = %.prol.loopexit94
  br label %.lr.ph45.split.us.new

.lr.ph45.split.us.new:                            ; preds = %.lr.ph45.split.us.new.preheader, %.lr.ph45.split.us.new
  %indvars.iv89 = phi i64 [ %indvars.iv.next90.1, %.lr.ph45.split.us.new ], [ %indvars.iv89.unr.ph, %.lr.ph45.split.us.new.preheader ]
  %69 = phi double [ %81, %.lr.ph45.split.us.new ], [ %.unr.ph, %.lr.ph45.split.us.new.preheader ]
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 %indvars.iv97
  %71 = load double, double* %70, align 8
  %72 = load double, double* %62, align 8
  %73 = fsub double %71, %72
  %74 = fmul double %73, %73
  %75 = fadd double %69, %74
  store double %75, double* %61, align 8
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next90, i64 %indvars.iv97
  %77 = load double, double* %76, align 8
  %78 = load double, double* %62, align 8
  %79 = fsub double %77, %78
  %80 = fmul double %79, %79
  %81 = fadd double %75, %80
  store double %81, double* %61, align 8
  %indvars.iv.next90.1 = add nsw i64 %indvars.iv89, 2
  %exitcond92.1 = icmp eq i64 %indvars.iv.next90.1, %wide.trip.count91.1
  br i1 %exitcond92.1, label %._crit_edge43.us.loopexit, label %.lr.ph45.split.us.new

._crit_edge43.us.loopexit:                        ; preds = %.lr.ph45.split.us.new
  br label %._crit_edge43.us

._crit_edge43.us:                                 ; preds = %._crit_edge43.us.loopexit, %.prol.loopexit94
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit94 ], [ %81, %._crit_edge43.us.loopexit ]
  %82 = fdiv double %.lcssa, %2
  store double %82, double* %61, align 8
  %83 = tail call double @sqrt(double %82) #4
  %84 = fcmp ugt double %83, 1.000000e-01
  %85 = select i1 %84, double %83, double 1.000000e+00
  store double %85, double* %61, align 8
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next98, %wide.trip.count99
  br i1 %exitcond100, label %._crit_edge16.loopexit, label %.lr.ph45.split.us

.lr.ph51.split:                                   ; preds = %.lr.ph51.split.preheader158, %.lr.ph51.split
  %indvars.iv121 = phi i64 [ %indvars.iv.next122.3, %.lr.ph51.split ], [ %indvars.iv121.ph, %.lr.ph51.split.preheader158 ]
  %86 = getelementptr inbounds double, double* %5, i64 %indvars.iv121
  store double %14, double* %86, align 8
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %87 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next122
  store double %14, double* %87, align 8
  %indvars.iv.next122.1 = add nsw i64 %indvars.iv121, 2
  %88 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next122.1
  store double %14, double* %88, align 8
  %indvars.iv.next122.2 = add nsw i64 %indvars.iv121, 3
  %89 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next122.2
  store double %14, double* %89, align 8
  %indvars.iv.next122.3 = add nsw i64 %indvars.iv121, 4
  %exitcond124.3 = icmp eq i64 %indvars.iv.next122.3, %wide.trip.count123.3
  br i1 %exitcond124.3, label %._crit_edge.loopexit159, label %.lr.ph51.split, !llvm.loop !7

._crit_edge16.loopexit:                           ; preds = %._crit_edge43.us
  br label %._crit_edge16

._crit_edge16.loopexit157:                        ; preds = %.lr.ph45.split
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit157, %._crit_edge16.loopexit, %._crit_edge.._crit_edge16_crit_edge, %7, %.lr.ph45.split.prol.loopexit
  %90 = icmp sgt i32 %1, 0
  br i1 %90, label %._crit_edge17.lr.ph, label %._crit_edge18

._crit_edge17.lr.ph:                              ; preds = %._crit_edge16
  br i1 %8, label %._crit_edge17.us.preheader, label %._crit_edge18.thread

._crit_edge17.us.preheader:                       ; preds = %._crit_edge17.lr.ph
  %wide.trip.count82 = zext i32 %0 to i64
  %wide.trip.count86 = zext i32 %1 to i64
  br label %._crit_edge17.us

._crit_edge18.thread:                             ; preds = %._crit_edge17.lr.ph
  %91 = add nsw i32 %0, -1
  br label %._crit_edge31

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.preheader, %._crit_edge39.us
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %._crit_edge39.us ], [ 0, %._crit_edge17.us.preheader ]
  br label %92

; <label>:92:                                     ; preds = %92, %._crit_edge17.us
  %indvars.iv80 = phi i64 [ 0, %._crit_edge17.us ], [ %indvars.iv.next81, %92 ]
  %93 = getelementptr inbounds double, double* %5, i64 %indvars.iv80
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv84, i64 %indvars.iv80
  %96 = load double, double* %95, align 8
  %97 = fsub double %96, %94
  store double %97, double* %95, align 8
  %98 = tail call double @sqrt(double %2) #4
  %99 = getelementptr inbounds double, double* %6, i64 %indvars.iv80
  %100 = load double, double* %99, align 8
  %101 = fmul double %98, %100
  %102 = load double, double* %95, align 8
  %103 = fdiv double %102, %101
  store double %103, double* %95, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next81, %wide.trip.count82
  br i1 %exitcond83, label %._crit_edge39.us, label %92

._crit_edge39.us:                                 ; preds = %92
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next85, %wide.trip.count86
  br i1 %exitcond87, label %._crit_edge18.loopexit, label %._crit_edge17.us

.lr.ph45.split:                                   ; preds = %.lr.ph45.split.preheader131, %.lr.ph45.split
  %indvars.iv101 = phi i64 [ %indvars.iv.next102.1, %.lr.ph45.split ], [ %indvars.iv101.unr, %.lr.ph45.split.preheader131 ]
  %104 = getelementptr inbounds double, double* %6, i64 %indvars.iv101
  store double %60, double* %104, align 8
  %105 = tail call double @sqrt(double %60) #4
  %106 = fcmp ugt double %105, 1.000000e-01
  %107 = select i1 %106, double %105, double 1.000000e+00
  store double %107, double* %104, align 8
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %108 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next102
  store double %60, double* %108, align 8
  %109 = tail call double @sqrt(double %60) #4
  %110 = fcmp ugt double %109, 1.000000e-01
  %111 = select i1 %110, double %109, double 1.000000e+00
  store double %111, double* %108, align 8
  %indvars.iv.next102.1 = add nsw i64 %indvars.iv101, 2
  %exitcond104.1 = icmp eq i64 %indvars.iv.next102.1, %wide.trip.count103.1
  br i1 %exitcond104.1, label %._crit_edge16.loopexit157, label %.lr.ph45.split

._crit_edge18.loopexit:                           ; preds = %._crit_edge39.us
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit, %._crit_edge16
  %112 = add nsw i32 %0, -1
  %113 = icmp sgt i32 %0, 1
  br i1 %113, label %.lr.ph30, label %._crit_edge31

.lr.ph30:                                         ; preds = %._crit_edge18
  br i1 %90, label %.lr.ph30.split.us.preheader, label %.lr.ph30.split.preheader

.lr.ph30.split.preheader:                         ; preds = %.lr.ph30
  %114 = zext i32 %112 to i64
  %115 = add i32 %0, -2
  %116 = zext i32 %115 to i64
  %117 = sext i32 %0 to i64
  %wide.trip.count71.3 = zext i32 %0 to i64
  br label %.lr.ph30.split

.lr.ph30.split.us.preheader:                      ; preds = %.lr.ph30
  %118 = sext i32 %0 to i64
  %wide.trip.count65 = zext i32 %112 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %119 = icmp eq i32 %1, 1
  %wide.trip.count61 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph30.split.us

.lr.ph30.split.us:                                ; preds = %._crit_edge29.us-lcssa.us.us, %.lr.ph30.split.us.preheader
  %indvars.iv63 = phi i64 [ 0, %.lr.ph30.split.us.preheader ], [ %indvars.iv.next64, %._crit_edge29.us-lcssa.us.us ]
  %indvars.iv57 = phi i64 [ 1, %.lr.ph30.split.us.preheader ], [ %indvars.iv.next58, %._crit_edge29.us-lcssa.us.us ]
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv63, i64 %indvars.iv63
  store double 1.000000e+00, double* %120, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %121 = icmp slt i64 %indvars.iv.next64, %118
  br i1 %121, label %.lr.ph.us.us.preheader, label %._crit_edge29.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph30.split.us
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv63
  br label %.lr.ph.us.us

._crit_edge29.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge24.us.us
  br label %._crit_edge29.us-lcssa.us.us

._crit_edge29.us-lcssa.us.us:                     ; preds = %._crit_edge29.us-lcssa.us.us.loopexit, %.lr.ph30.split.us
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next64, %wide.trip.count65
  br i1 %exitcond66, label %._crit_edge31.loopexit, label %.lr.ph30.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge24.us.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge24.us.us ], [ %indvars.iv57, %.lr.ph.us.us.preheader ]
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv63, i64 %indvars.iv59
  store double 0.000000e+00, double* %123, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %124 = load double, double* %122, align 8
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv59
  %126 = load double, double* %125, align 8
  %127 = fmul double %124, %126
  %128 = fadd double %127, 0.000000e+00
  store double %128, double* %123, align 8
  %129 = bitcast double %128 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %130 = phi i64 [ %129, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %131 = phi double [ %128, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %119, label %._crit_edge24.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge24.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  %132 = bitcast double %148 to i64
  br label %._crit_edge24.us.us

._crit_edge24.us.us:                              ; preds = %._crit_edge24.us.us.loopexit, %.prol.loopexit
  %133 = phi i64 [ %130, %.prol.loopexit ], [ %132, %._crit_edge24.us.us.loopexit ]
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv59, i64 %indvars.iv63
  %135 = bitcast double* %134 to i64*
  store i64 %133, i64* %135, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond = icmp eq i64 %indvars.iv.next60, %wide.trip.count61
  br i1 %exitcond, label %._crit_edge29.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %136 = phi double [ %148, %.lr.ph.us.us.new ], [ %131, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv63
  %138 = load double, double* %137, align 8
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv59
  %140 = load double, double* %139, align 8
  %141 = fmul double %138, %140
  %142 = fadd double %136, %141
  store double %142, double* %123, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %143 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv63
  %144 = load double, double* %143, align 8
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv59
  %146 = load double, double* %145, align 8
  %147 = fmul double %144, %146
  %148 = fadd double %142, %147
  store double %148, double* %123, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge24.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph30.split:                                   ; preds = %._crit_edge29, %.lr.ph30.split.preheader
  %indvars.iv76 = phi i64 [ 0, %.lr.ph30.split.preheader ], [ %indvars.iv.next77, %._crit_edge29 ]
  %indvars.iv67 = phi i64 [ 1, %.lr.ph30.split.preheader ], [ %indvars.iv.next68, %._crit_edge29 ]
  %149 = sub i64 %116, %indvars.iv76
  %150 = trunc i64 %149 to i32
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv76, i64 %indvars.iv76
  store double 1.000000e+00, double* %151, align 8
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %152 = icmp slt i64 %indvars.iv.next77, %117
  br i1 %152, label %.lr.ph28.split.preheader, label %._crit_edge29

.lr.ph28.split.preheader:                         ; preds = %.lr.ph30.split
  %153 = sub i64 %114, %indvars.iv76
  %154 = trunc i64 %153 to i32
  %xtraiter74 = and i32 %154, 3
  %lcmp.mod75 = icmp eq i32 %xtraiter74, 0
  br i1 %lcmp.mod75, label %.lr.ph28.split.prol.loopexit, label %.lr.ph28.split.prol.preheader

.lr.ph28.split.prol.preheader:                    ; preds = %.lr.ph28.split.preheader
  br label %.lr.ph28.split.prol

.lr.ph28.split.prol:                              ; preds = %.lr.ph28.split.prol.preheader, %.lr.ph28.split.prol
  %indvars.iv69.prol = phi i64 [ %indvars.iv.next70.prol, %.lr.ph28.split.prol ], [ %indvars.iv67, %.lr.ph28.split.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph28.split.prol ], [ %xtraiter74, %.lr.ph28.split.prol.preheader ]
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv76, i64 %indvars.iv69.prol
  store double 0.000000e+00, double* %155, align 8
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv69.prol, i64 %indvars.iv76
  %157 = bitcast double* %156 to i64*
  store i64 0, i64* %157, align 8
  %indvars.iv.next70.prol = add nuw nsw i64 %indvars.iv69.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph28.split.prol.loopexit.loopexit, label %.lr.ph28.split.prol, !llvm.loop !9

.lr.ph28.split.prol.loopexit.loopexit:            ; preds = %.lr.ph28.split.prol
  br label %.lr.ph28.split.prol.loopexit

.lr.ph28.split.prol.loopexit:                     ; preds = %.lr.ph28.split.prol.loopexit.loopexit, %.lr.ph28.split.preheader
  %indvars.iv69.unr = phi i64 [ %indvars.iv67, %.lr.ph28.split.preheader ], [ %indvars.iv.next70.prol, %.lr.ph28.split.prol.loopexit.loopexit ]
  %158 = icmp ult i32 %150, 3
  br i1 %158, label %._crit_edge29, label %.lr.ph28.split.preheader155

.lr.ph28.split.preheader155:                      ; preds = %.lr.ph28.split.prol.loopexit
  br label %.lr.ph28.split

.lr.ph28.split:                                   ; preds = %.lr.ph28.split.preheader155, %.lr.ph28.split
  %indvars.iv69 = phi i64 [ %indvars.iv.next70.3, %.lr.ph28.split ], [ %indvars.iv69.unr, %.lr.ph28.split.preheader155 ]
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv76, i64 %indvars.iv69
  store double 0.000000e+00, double* %159, align 8
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv69, i64 %indvars.iv76
  %161 = bitcast double* %160 to i64*
  store i64 0, i64* %161, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv76, i64 %indvars.iv.next70
  store double 0.000000e+00, double* %162, align 8
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next70, i64 %indvars.iv76
  %164 = bitcast double* %163 to i64*
  store i64 0, i64* %164, align 8
  %indvars.iv.next70.1 = add nsw i64 %indvars.iv69, 2
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv76, i64 %indvars.iv.next70.1
  store double 0.000000e+00, double* %165, align 8
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next70.1, i64 %indvars.iv76
  %167 = bitcast double* %166 to i64*
  store i64 0, i64* %167, align 8
  %indvars.iv.next70.2 = add nsw i64 %indvars.iv69, 3
  %168 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv76, i64 %indvars.iv.next70.2
  store double 0.000000e+00, double* %168, align 8
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next70.2, i64 %indvars.iv76
  %170 = bitcast double* %169 to i64*
  store i64 0, i64* %170, align 8
  %indvars.iv.next70.3 = add nsw i64 %indvars.iv69, 4
  %exitcond72.3 = icmp eq i64 %indvars.iv.next70.3, %wide.trip.count71.3
  br i1 %exitcond72.3, label %._crit_edge29.loopexit, label %.lr.ph28.split

._crit_edge29.loopexit:                           ; preds = %.lr.ph28.split
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %.lr.ph28.split.prol.loopexit, %.lr.ph30.split
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next77, %114
  br i1 %exitcond79, label %._crit_edge31.loopexit156, label %.lr.ph30.split

._crit_edge31.loopexit:                           ; preds = %._crit_edge29.us-lcssa.us.us
  br label %._crit_edge31

._crit_edge31.loopexit156:                        ; preds = %._crit_edge29
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit156, %._crit_edge31.loopexit, %._crit_edge18.thread, %._crit_edge18
  %171 = phi i32 [ %91, %._crit_edge18.thread ], [ %112, %._crit_edge18 ], [ %112, %._crit_edge31.loopexit ], [ %112, %._crit_edge31.loopexit156 ]
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %172, i64 %172
  store double 1.000000e+00, double* %173, align 8
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
  br i1 %7, label %._crit_edge.us.preheader, label %._crit_edge5

._crit_edge.us.preheader:                         ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge3.us, %._crit_edge.us.preheader
  %indvars.iv6 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next7, %._crit_edge3.us ]
  %9 = mul nsw i64 %indvars.iv6, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge2.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge3.us, label %10

._crit_edge3.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count
  br i1 %exitcond9, label %._crit_edge5.loopexit, label %._crit_edge.us

._crit_edge5.loopexit:                            ; preds = %._crit_edge3.us
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !8, !4, !5}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
!9 = distinct !{!9, !2}
