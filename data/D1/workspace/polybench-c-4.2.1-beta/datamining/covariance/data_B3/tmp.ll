; ModuleID = 'A.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
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
  %7 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1400, double* nonnull %3, [1200 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @kernel_covariance(i32 1200, i32 1400, double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  %4 = sitofp i32 %0 to double
  store double %4, double* %1, align 8
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %17, %3
  %indvars.iv4 = phi i64 [ 0, %3 ], [ %indvars.iv.next5, %17 ]
  %5 = trunc i64 %indvars.iv4 to i32
  %6 = sitofp i32 %5 to double
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = sitofp i32 %7 to double
  %9 = fmul double %6, %8
  %10 = fdiv double %9, 1.200000e+03
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv
  store double %10, double* %11, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = trunc i64 %indvars.iv.next to i32
  %13 = sitofp i32 %12 to double
  %14 = fmul double %6, %13
  %15 = fdiv double %14, 1.200000e+03
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv.next
  store double %15, double* %16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next5, 1400
  br i1 %exitcond, label %18, label %._crit_edge.preheader

; <label>:18:                                     ; preds = %17
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_covariance(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) unnamed_addr #2 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph30, label %._crit_edge.preheader

.lr.ph30:                                         ; preds = %6
  %8 = icmp sgt i32 %1, 0
  br i1 %8, label %.lr.ph30.split.us.preheader, label %.lr.ph30.split.preheader

.lr.ph30.split.preheader:                         ; preds = %.lr.ph30
  %9 = add i32 %0, -1
  %xtraiter86 = and i32 %0, 3
  %lcmp.mod87 = icmp eq i32 %xtraiter86, 0
  br i1 %lcmp.mod87, label %.lr.ph30.split.prol.loopexit, label %.lr.ph30.split.prol.preheader

.lr.ph30.split.prol.preheader:                    ; preds = %.lr.ph30.split.preheader
  %10 = fdiv double 0.000000e+00, %2
  br label %.lr.ph30.split.prol

.lr.ph30.split.prol:                              ; preds = %.lr.ph30.split.prol.preheader, %.lr.ph30.split.prol
  %indvars.iv82.prol = phi i64 [ %indvars.iv.next83.prol, %.lr.ph30.split.prol ], [ 0, %.lr.ph30.split.prol.preheader ]
  %prol.iter88 = phi i32 [ %prol.iter88.sub, %.lr.ph30.split.prol ], [ %xtraiter86, %.lr.ph30.split.prol.preheader ]
  %11 = getelementptr inbounds double, double* %5, i64 %indvars.iv82.prol
  store double %10, double* %11, align 8
  %indvars.iv.next83.prol = add nuw nsw i64 %indvars.iv82.prol, 1
  %prol.iter88.sub = add i32 %prol.iter88, -1
  %prol.iter88.cmp = icmp eq i32 %prol.iter88.sub, 0
  br i1 %prol.iter88.cmp, label %.lr.ph30.split.prol.loopexit.loopexit, label %.lr.ph30.split.prol, !llvm.loop !1

.lr.ph30.split.prol.loopexit.loopexit:            ; preds = %.lr.ph30.split.prol
  br label %.lr.ph30.split.prol.loopexit

.lr.ph30.split.prol.loopexit:                     ; preds = %.lr.ph30.split.prol.loopexit.loopexit, %.lr.ph30.split.preheader
  %indvars.iv82.unr = phi i64 [ 0, %.lr.ph30.split.preheader ], [ %indvars.iv.next83.prol, %.lr.ph30.split.prol.loopexit.loopexit ]
  %12 = icmp ult i32 %9, 3
  br i1 %12, label %._crit_edge.preheader, label %.lr.ph30.split.preheader91

.lr.ph30.split.preheader91:                       ; preds = %.lr.ph30.split.prol.loopexit
  %13 = fdiv double 0.000000e+00, %2
  %14 = fdiv double 0.000000e+00, %2
  %15 = fdiv double 0.000000e+00, %2
  %16 = fdiv double 0.000000e+00, %2
  %wide.trip.count84.3 = zext i32 %0 to i64
  %17 = add nsw i64 %wide.trip.count84.3, -4
  %18 = sub i64 %17, %indvars.iv82.unr
  %19 = lshr i64 %18, 2
  %20 = add nuw nsw i64 %19, 1
  %min.iters.check = icmp ult i64 %20, 4
  br i1 %min.iters.check, label %.lr.ph30.split.preheader145, label %min.iters.checked

.lr.ph30.split.preheader145:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph30.split.preheader91
  %indvars.iv82.ph = phi i64 [ %indvars.iv82.unr, %min.iters.checked ], [ %indvars.iv82.unr, %.lr.ph30.split.preheader91 ], [ %ind.end, %middle.block ]
  br label %.lr.ph30.split

min.iters.checked:                                ; preds = %.lr.ph30.split.preheader91
  %n.mod.vf = and i64 %20, 3
  %n.vec = sub nsw i64 %20, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %21 = shl nuw i64 %19, 2
  %22 = add i64 %indvars.iv82.unr, %21
  %23 = add i64 %22, 4
  %24 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %23, %24
  br i1 %cmp.zero, label %.lr.ph30.split.preheader145, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert96 = insertelement <2 x double> undef, double %13, i32 0
  %broadcast.splat97 = shufflevector <2 x double> %broadcast.splatinsert96, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert98 = insertelement <2 x double> undef, double %14, i32 0
  %broadcast.splat99 = shufflevector <2 x double> %broadcast.splatinsert98, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert100 = insertelement <2 x double> undef, double %15, i32 0
  %broadcast.splat101 = shufflevector <2 x double> %broadcast.splatinsert100, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert102 = insertelement <2 x double> undef, double %16, i32 0
  %broadcast.splat103 = shufflevector <2 x double> %broadcast.splatinsert102, <2 x double> undef, <2 x i32> zeroinitializer
  %25 = shufflevector <2 x double> %broadcast.splat97, <2 x double> %broadcast.splat99, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %26 = shufflevector <2 x double> %broadcast.splat101, <2 x double> %broadcast.splat103, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %25, <4 x double> %26, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %27 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv82.unr, %27
  %28 = add i64 %indvars.iv82.unr, %27
  %29 = add nsw i64 %28, 3
  %30 = add i64 %offset.idx, 11
  %31 = getelementptr inbounds double, double* %5, i64 %29
  %32 = getelementptr inbounds double, double* %5, i64 %30
  %33 = getelementptr double, double* %31, i64 -3
  %34 = bitcast double* %33 to <8 x double>*
  %35 = getelementptr double, double* %32, i64 -3
  %36 = bitcast double* %35 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %34, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %36, align 8
  %index.next = add i64 %index, 4
  %37 = icmp eq i64 %index.next, %n.vec
  br i1 %37, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge.preheader, label %.lr.ph30.split.preheader145

.lr.ph30.split.us.preheader:                      ; preds = %.lr.ph30
  %38 = add i32 %1, -1
  %xtraiter75 = and i32 %1, 3
  %lcmp.mod76 = icmp eq i32 %xtraiter75, 0
  %39 = icmp ult i32 %38, 3
  %wide.trip.count80 = zext i32 %0 to i64
  %wide.trip.count71.3 = zext i32 %1 to i64
  br label %.lr.ph30.split.us

.lr.ph30.split.us:                                ; preds = %._crit_edge27.us, %.lr.ph30.split.us.preheader
  %indvars.iv78 = phi i64 [ 0, %.lr.ph30.split.us.preheader ], [ %indvars.iv.next79, %._crit_edge27.us ]
  %40 = getelementptr inbounds double, double* %5, i64 %indvars.iv78
  store double 0.000000e+00, double* %40, align 8
  br i1 %lcmp.mod76, label %.prol.loopexit74, label %.prol.preheader73.preheader

.prol.preheader73.preheader:                      ; preds = %.lr.ph30.split.us
  br label %.prol.preheader73

.prol.preheader73:                                ; preds = %.prol.preheader73.preheader, %.prol.preheader73
  %indvars.iv69.prol = phi i64 [ %indvars.iv.next70.prol, %.prol.preheader73 ], [ 0, %.prol.preheader73.preheader ]
  %prol.iter77 = phi i32 [ %prol.iter77.sub, %.prol.preheader73 ], [ %xtraiter75, %.prol.preheader73.preheader ]
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv69.prol, i64 %indvars.iv78
  %42 = load double, double* %41, align 8
  %43 = load double, double* %40, align 8
  %44 = fadd double %42, %43
  store double %44, double* %40, align 8
  %indvars.iv.next70.prol = add nuw nsw i64 %indvars.iv69.prol, 1
  %prol.iter77.sub = add i32 %prol.iter77, -1
  %prol.iter77.cmp = icmp eq i32 %prol.iter77.sub, 0
  br i1 %prol.iter77.cmp, label %.prol.loopexit74.loopexit, label %.prol.preheader73, !llvm.loop !6

.prol.loopexit74.loopexit:                        ; preds = %.prol.preheader73
  br label %.prol.loopexit74

.prol.loopexit74:                                 ; preds = %.prol.loopexit74.loopexit, %.lr.ph30.split.us
  %indvars.iv69.unr = phi i64 [ 0, %.lr.ph30.split.us ], [ %indvars.iv.next70.prol, %.prol.loopexit74.loopexit ]
  br i1 %39, label %._crit_edge27.us, label %.lr.ph30.split.us.new.preheader

.lr.ph30.split.us.new.preheader:                  ; preds = %.prol.loopexit74
  br label %.lr.ph30.split.us.new

.lr.ph30.split.us.new:                            ; preds = %.lr.ph30.split.us.new.preheader, %.lr.ph30.split.us.new
  %indvars.iv69 = phi i64 [ %indvars.iv.next70.3, %.lr.ph30.split.us.new ], [ %indvars.iv69.unr, %.lr.ph30.split.us.new.preheader ]
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv69, i64 %indvars.iv78
  %46 = load double, double* %45, align 8
  %47 = load double, double* %40, align 8
  %48 = fadd double %46, %47
  store double %48, double* %40, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next70, i64 %indvars.iv78
  %50 = load double, double* %49, align 8
  %51 = fadd double %50, %48
  store double %51, double* %40, align 8
  %indvars.iv.next70.1 = add nsw i64 %indvars.iv69, 2
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next70.1, i64 %indvars.iv78
  %53 = load double, double* %52, align 8
  %54 = fadd double %53, %51
  store double %54, double* %40, align 8
  %indvars.iv.next70.2 = add nsw i64 %indvars.iv69, 3
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next70.2, i64 %indvars.iv78
  %56 = load double, double* %55, align 8
  %57 = fadd double %56, %54
  store double %57, double* %40, align 8
  %indvars.iv.next70.3 = add nsw i64 %indvars.iv69, 4
  %exitcond72.3 = icmp eq i64 %indvars.iv.next70.3, %wide.trip.count71.3
  br i1 %exitcond72.3, label %._crit_edge27.us.loopexit, label %.lr.ph30.split.us.new

._crit_edge27.us.loopexit:                        ; preds = %.lr.ph30.split.us.new
  br label %._crit_edge27.us

._crit_edge27.us:                                 ; preds = %._crit_edge27.us.loopexit, %.prol.loopexit74
  %58 = load double, double* %40, align 8
  %59 = fdiv double %58, %2
  store double %59, double* %40, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next79, %wide.trip.count80
  br i1 %exitcond81, label %._crit_edge.preheader.loopexit, label %.lr.ph30.split.us

._crit_edge.preheader.loopexit:                   ; preds = %._crit_edge27.us
  br label %._crit_edge.preheader

._crit_edge.preheader.loopexit146:                ; preds = %.lr.ph30.split
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge.preheader.loopexit146, %._crit_edge.preheader.loopexit, %middle.block, %.lr.ph30.split.prol.loopexit, %6
  %60 = icmp sgt i32 %1, 0
  br i1 %60, label %._crit_edge5.preheader.lr.ph, label %._crit_edge6.preheader

._crit_edge5.preheader.lr.ph:                     ; preds = %._crit_edge.preheader
  %61 = icmp sgt i32 %0, 0
  br i1 %61, label %._crit_edge5.preheader.us.preheader, label %._crit_edge6._crit_edge

._crit_edge5.preheader.us.preheader:              ; preds = %._crit_edge5.preheader.lr.ph
  %62 = add i32 %0, -1
  %xtraiter63 = and i32 %0, 3
  %lcmp.mod64 = icmp eq i32 %xtraiter63, 0
  %63 = icmp ult i32 %62, 3
  %wide.trip.count67 = zext i32 %1 to i64
  %wide.trip.count61.3 = zext i32 %0 to i64
  %64 = add nsw i64 %wide.trip.count61.3, -4
  %65 = add nsw i64 %wide.trip.count61.3, -4
  %scevgep121 = getelementptr double, double* %5, i64 4
  br label %._crit_edge5.preheader.us

._crit_edge5.preheader.us:                        ; preds = %._crit_edge5._crit_edge.us, %._crit_edge5.preheader.us.preheader
  %indvars.iv65 = phi i64 [ 0, %._crit_edge5.preheader.us.preheader ], [ %indvars.iv.next66, %._crit_edge5._crit_edge.us ]
  %scevgep116 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv65, i64 4
  br i1 %lcmp.mod64, label %._crit_edge5.us.prol.loopexit, label %._crit_edge5.us.prol.preheader

._crit_edge5.us.prol.preheader:                   ; preds = %._crit_edge5.preheader.us
  br label %._crit_edge5.us.prol

._crit_edge5.us.prol:                             ; preds = %._crit_edge5.us.prol.preheader, %._crit_edge5.us.prol
  %indvars.iv59.prol = phi i64 [ %indvars.iv.next60.prol, %._crit_edge5.us.prol ], [ 0, %._crit_edge5.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %._crit_edge5.us.prol ], [ %xtraiter63, %._crit_edge5.us.prol.preheader ]
  %66 = getelementptr inbounds double, double* %5, i64 %indvars.iv59.prol
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv65, i64 %indvars.iv59.prol
  %69 = load double, double* %68, align 8
  %70 = fsub double %69, %67
  store double %70, double* %68, align 8
  %indvars.iv.next60.prol = add nuw nsw i64 %indvars.iv59.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge5.us.prol.loopexit.loopexit, label %._crit_edge5.us.prol, !llvm.loop !7

._crit_edge5.us.prol.loopexit.loopexit:           ; preds = %._crit_edge5.us.prol
  br label %._crit_edge5.us.prol.loopexit

._crit_edge5.us.prol.loopexit:                    ; preds = %._crit_edge5.us.prol.loopexit.loopexit, %._crit_edge5.preheader.us
  %indvars.iv59.unr = phi i64 [ 0, %._crit_edge5.preheader.us ], [ %indvars.iv.next60.prol, %._crit_edge5.us.prol.loopexit.loopexit ]
  br i1 %63, label %._crit_edge5._crit_edge.us, label %._crit_edge5.us.preheader

._crit_edge5.us.preheader:                        ; preds = %._crit_edge5.us.prol.loopexit
  %71 = sub i64 %64, %indvars.iv59.unr
  %72 = lshr i64 %71, 2
  %73 = add nuw nsw i64 %72, 1
  %min.iters.check108 = icmp ult i64 %73, 2
  br i1 %min.iters.check108, label %._crit_edge5.us.preheader144, label %min.iters.checked109

min.iters.checked109:                             ; preds = %._crit_edge5.us.preheader
  %n.mod.vf110 = and i64 %73, 1
  %n.vec111 = sub nsw i64 %73, %n.mod.vf110
  %cmp.zero112 = icmp eq i64 %n.vec111, 0
  br i1 %cmp.zero112, label %._crit_edge5.us.preheader144, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked109
  %scevgep114 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv65, i64 %indvars.iv59.unr
  %74 = sub i64 %65, %indvars.iv59.unr
  %75 = and i64 %74, -4
  %76 = add i64 %indvars.iv59.unr, %75
  %scevgep117 = getelementptr double, double* %scevgep116, i64 %76
  %scevgep119 = getelementptr double, double* %5, i64 %indvars.iv59.unr
  %scevgep122 = getelementptr double, double* %scevgep121, i64 %76
  %bound0 = icmp ult double* %scevgep114, %scevgep122
  %bound1 = icmp ult double* %scevgep119, %scevgep117
  %memcheck.conflict = and i1 %bound0, %bound1
  %77 = add i64 %indvars.iv59.unr, 4
  %78 = shl nuw i64 %72, 2
  %79 = add i64 %77, %78
  %80 = shl nuw nsw i64 %n.mod.vf110, 2
  %ind.end128 = sub i64 %79, %80
  br i1 %memcheck.conflict, label %._crit_edge5.us.preheader144, label %vector.body105.preheader

vector.body105.preheader:                         ; preds = %vector.memcheck
  br label %vector.body105

vector.body105:                                   ; preds = %vector.body105.preheader, %vector.body105
  %index125 = phi i64 [ %index.next126, %vector.body105 ], [ 0, %vector.body105.preheader ]
  %81 = shl i64 %index125, 2
  %82 = add i64 %indvars.iv59.unr, %81
  %83 = getelementptr inbounds double, double* %5, i64 %82
  %84 = bitcast double* %83 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %84, align 8, !alias.scope !8
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv65, i64 %82
  %86 = bitcast double* %85 to <8 x double>*
  %wide.vec137 = load <8 x double>, <8 x double>* %86, align 8, !alias.scope !11, !noalias !8
  %87 = fsub <8 x double> %wide.vec137, %wide.vec
  %88 = shufflevector <8 x double> %87, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %89 = fsub <8 x double> %wide.vec137, %wide.vec
  %90 = shufflevector <8 x double> %89, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %91 = fsub <8 x double> %wide.vec137, %wide.vec
  %92 = shufflevector <8 x double> %91, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %93 = add nsw i64 %82, 3
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv65, i64 %93
  %95 = fsub <8 x double> %wide.vec137, %wide.vec
  %96 = shufflevector <8 x double> %95, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %97 = getelementptr double, double* %94, i64 -3
  %98 = bitcast double* %97 to <8 x double>*
  %99 = shufflevector <2 x double> %88, <2 x double> %90, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %100 = shufflevector <2 x double> %92, <2 x double> %96, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec142 = shufflevector <4 x double> %99, <4 x double> %100, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec142, <8 x double>* %98, align 8, !alias.scope !11, !noalias !8
  %index.next126 = add i64 %index125, 2
  %101 = icmp eq i64 %index.next126, %n.vec111
  br i1 %101, label %middle.block106, label %vector.body105, !llvm.loop !13

middle.block106:                                  ; preds = %vector.body105
  %cmp.n129 = icmp eq i64 %n.mod.vf110, 0
  br i1 %cmp.n129, label %._crit_edge5._crit_edge.us, label %._crit_edge5.us.preheader144

._crit_edge5.us.preheader144:                     ; preds = %middle.block106, %vector.memcheck, %min.iters.checked109, %._crit_edge5.us.preheader
  %indvars.iv59.ph = phi i64 [ %indvars.iv59.unr, %vector.memcheck ], [ %indvars.iv59.unr, %min.iters.checked109 ], [ %indvars.iv59.unr, %._crit_edge5.us.preheader ], [ %ind.end128, %middle.block106 ]
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.preheader144, %._crit_edge5.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60.3, %._crit_edge5.us ], [ %indvars.iv59.ph, %._crit_edge5.us.preheader144 ]
  %102 = getelementptr inbounds double, double* %5, i64 %indvars.iv59
  %103 = load double, double* %102, align 8
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv65, i64 %indvars.iv59
  %105 = load double, double* %104, align 8
  %106 = fsub double %105, %103
  store double %106, double* %104, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %107 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next60
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv65, i64 %indvars.iv.next60
  %110 = load double, double* %109, align 8
  %111 = fsub double %110, %108
  store double %111, double* %109, align 8
  %indvars.iv.next60.1 = add nsw i64 %indvars.iv59, 2
  %112 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next60.1
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv65, i64 %indvars.iv.next60.1
  %115 = load double, double* %114, align 8
  %116 = fsub double %115, %113
  store double %116, double* %114, align 8
  %indvars.iv.next60.2 = add nsw i64 %indvars.iv59, 3
  %117 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next60.2
  %118 = load double, double* %117, align 8
  %119 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv65, i64 %indvars.iv.next60.2
  %120 = load double, double* %119, align 8
  %121 = fsub double %120, %118
  store double %121, double* %119, align 8
  %indvars.iv.next60.3 = add nsw i64 %indvars.iv59, 4
  %exitcond62.3 = icmp eq i64 %indvars.iv.next60.3, %wide.trip.count61.3
  br i1 %exitcond62.3, label %._crit_edge5._crit_edge.us.loopexit, label %._crit_edge5.us, !llvm.loop !14

._crit_edge5._crit_edge.us.loopexit:              ; preds = %._crit_edge5.us
  br label %._crit_edge5._crit_edge.us

._crit_edge5._crit_edge.us:                       ; preds = %._crit_edge5._crit_edge.us.loopexit, %middle.block106, %._crit_edge5.us.prol.loopexit
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, %wide.trip.count67
  br i1 %exitcond68, label %._crit_edge6.preheader.loopexit, label %._crit_edge5.preheader.us

.lr.ph30.split:                                   ; preds = %.lr.ph30.split.preheader145, %.lr.ph30.split
  %indvars.iv82 = phi i64 [ %indvars.iv.next83.3, %.lr.ph30.split ], [ %indvars.iv82.ph, %.lr.ph30.split.preheader145 ]
  %122 = getelementptr inbounds double, double* %5, i64 %indvars.iv82
  store double %13, double* %122, align 8
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %123 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next83
  store double %14, double* %123, align 8
  %indvars.iv.next83.1 = add nsw i64 %indvars.iv82, 2
  %124 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next83.1
  store double %15, double* %124, align 8
  %indvars.iv.next83.2 = add nsw i64 %indvars.iv82, 3
  %125 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next83.2
  store double %16, double* %125, align 8
  %indvars.iv.next83.3 = add nsw i64 %indvars.iv82, 4
  %exitcond85.3 = icmp eq i64 %indvars.iv.next83.3, %wide.trip.count84.3
  br i1 %exitcond85.3, label %._crit_edge.preheader.loopexit146, label %.lr.ph30.split, !llvm.loop !15

._crit_edge6.preheader.loopexit:                  ; preds = %._crit_edge5._crit_edge.us
  br label %._crit_edge6.preheader

._crit_edge6.preheader:                           ; preds = %._crit_edge6.preheader.loopexit, %._crit_edge.preheader
  %126 = icmp sgt i32 %0, 0
  br i1 %126, label %._crit_edge7.preheader.lr.ph, label %._crit_edge6._crit_edge

._crit_edge7.preheader.lr.ph:                     ; preds = %._crit_edge6.preheader
  %127 = icmp sgt i32 %1, 0
  %128 = fadd double %2, -1.000000e+00
  br i1 %127, label %.lr.ph12.us.preheader, label %._crit_edge7.preheader.preheader

.lr.ph12.us.preheader:                            ; preds = %._crit_edge7.preheader.lr.ph
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %129 = icmp eq i32 %1, 1
  %wide.trip.count41 = zext i32 %0 to i64
  %wide.trip.count34.1 = zext i32 %1 to i64
  %wide.trip.count45 = zext i32 %0 to i64
  br label %.lr.ph12.us

._crit_edge7.preheader.preheader:                 ; preds = %._crit_edge7.preheader.lr.ph
  %130 = zext i32 %0 to i64
  %131 = add i32 %0, -1
  %132 = zext i32 %131 to i64
  %wide.trip.count57 = zext i32 %0 to i64
  %133 = fdiv double 0.000000e+00, %128
  %134 = fdiv double 0.000000e+00, %128
  %wide.trip.count51.1 = zext i32 %0 to i64
  %135 = fdiv double 0.000000e+00, %128
  %136 = add nsw i64 %wide.trip.count57, -2
  br label %.lr.ph12

._crit_edge6.us:                                  ; preds = %._crit_edge10.us.us
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %._crit_edge6._crit_edge.loopexit, label %.lr.ph12.us

.lr.ph12.us:                                      ; preds = %.lr.ph12.us.preheader, %._crit_edge6.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge6.us ], [ 0, %.lr.ph12.us.preheader ]
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv43
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge10.us.us, %.lr.ph12.us
  %indvars.iv38 = phi i64 [ %indvars.iv43, %.lr.ph12.us ], [ %indvars.iv.next39, %._crit_edge10.us.us ]
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 %indvars.iv38
  store double 0.000000e+00, double* %138, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %139 = load double, double* %137, align 8
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv38
  %141 = load double, double* %140, align 8
  %142 = fmul double %139, %141
  %143 = load double, double* %138, align 8
  %144 = fadd double %143, %142
  store double %144, double* %138, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %129, label %._crit_edge10.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge10.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  br label %._crit_edge10.us.us

._crit_edge10.us.us:                              ; preds = %._crit_edge10.us.us.loopexit, %.prol.loopexit
  %145 = load double, double* %138, align 8
  %146 = fdiv double %145, %128
  store double %146, double* %138, align 8
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv43
  store double %146, double* %147, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next39, %wide.trip.count41
  br i1 %exitcond42, label %._crit_edge6.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv43
  %149 = load double, double* %148, align 8
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv38
  %151 = load double, double* %150, align 8
  %152 = fmul double %149, %151
  %153 = load double, double* %138, align 8
  %154 = fadd double %153, %152
  store double %154, double* %138, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv43
  %156 = load double, double* %155, align 8
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv38
  %158 = load double, double* %157, align 8
  %159 = fmul double %156, %158
  %160 = load double, double* %138, align 8
  %161 = fadd double %160, %159
  store double %161, double* %138, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond35.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count34.1
  br i1 %exitcond35.1, label %._crit_edge10.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph12:                                         ; preds = %._crit_edge7.preheader.preheader, %._crit_edge6
  %indvars.iv55 = phi i64 [ 0, %._crit_edge7.preheader.preheader ], [ %indvars.iv.next56, %._crit_edge6 ]
  %162 = sub i64 %132, %indvars.iv55
  %163 = trunc i64 %162 to i32
  %164 = sub i64 %130, %indvars.iv55
  %xtraiter5389 = and i64 %164, 1
  %lcmp.mod54 = icmp eq i64 %xtraiter5389, 0
  br i1 %lcmp.mod54, label %._crit_edge7.prol.loopexit, label %._crit_edge7.prol

._crit_edge7.prol:                                ; preds = %.lr.ph12
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv55
  store double %135, double* %165, align 8
  %indvars.iv.next50.prol = add nuw nsw i64 %indvars.iv55, 1
  br label %._crit_edge7.prol.loopexit

._crit_edge7.prol.loopexit:                       ; preds = %._crit_edge7.prol, %.lr.ph12
  %indvars.iv49.unr.ph = phi i64 [ %indvars.iv.next50.prol, %._crit_edge7.prol ], [ %indvars.iv55, %.lr.ph12 ]
  %166 = icmp eq i32 %163, 0
  br i1 %166, label %._crit_edge6, label %._crit_edge7.preheader

._crit_edge7.preheader:                           ; preds = %._crit_edge7.prol.loopexit
  %167 = sub i64 %136, %indvars.iv49.unr.ph
  %168 = lshr i64 %167, 1
  %169 = and i64 %168, 1
  %lcmp.mod149 = icmp eq i64 %169, 0
  br i1 %lcmp.mod149, label %._crit_edge7.prol.preheader, label %._crit_edge7.prol.loopexit147.unr-lcssa

._crit_edge7.prol.preheader:                      ; preds = %._crit_edge7.preheader
  br label %._crit_edge7.prol150

._crit_edge7.prol150:                             ; preds = %._crit_edge7.prol.preheader
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv49.unr.ph
  store double %133, double* %170, align 8
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49.unr.ph, i64 %indvars.iv55
  store double %133, double* %171, align 8
  %indvars.iv.next50.prol151 = add nuw nsw i64 %indvars.iv49.unr.ph, 1
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv.next50.prol151
  store double %134, double* %172, align 8
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next50.prol151, i64 %indvars.iv55
  store double %134, double* %173, align 8
  %indvars.iv.next50.1.prol = add nsw i64 %indvars.iv49.unr.ph, 2
  br label %._crit_edge7.prol.loopexit147.unr-lcssa

._crit_edge7.prol.loopexit147.unr-lcssa:          ; preds = %._crit_edge7.preheader, %._crit_edge7.prol150
  %indvars.iv49.unr.ph152 = phi i64 [ %indvars.iv.next50.1.prol, %._crit_edge7.prol150 ], [ %indvars.iv49.unr.ph, %._crit_edge7.preheader ]
  br label %._crit_edge7.prol.loopexit147

._crit_edge7.prol.loopexit147:                    ; preds = %._crit_edge7.prol.loopexit147.unr-lcssa
  %174 = icmp eq i64 %168, 0
  br i1 %174, label %._crit_edge6.loopexit, label %._crit_edge7.preheader.new

._crit_edge7.preheader.new:                       ; preds = %._crit_edge7.prol.loopexit147
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7, %._crit_edge7.preheader.new
  %indvars.iv49 = phi i64 [ %indvars.iv49.unr.ph152, %._crit_edge7.preheader.new ], [ %indvars.iv.next50.1.1, %._crit_edge7 ]
  %175 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv49
  store double %133, double* %175, align 8
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv55
  store double %133, double* %176, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv.next50
  store double %134, double* %177, align 8
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next50, i64 %indvars.iv55
  store double %134, double* %178, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv.next50.1
  store double %133, double* %179, align 8
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next50.1, i64 %indvars.iv55
  store double %133, double* %180, align 8
  %indvars.iv.next50.1153 = add nsw i64 %indvars.iv49, 3
  %181 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv.next50.1153
  store double %134, double* %181, align 8
  %182 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next50.1153, i64 %indvars.iv55
  store double %134, double* %182, align 8
  %indvars.iv.next50.1.1 = add nsw i64 %indvars.iv49, 4
  %exitcond52.1.1 = icmp eq i64 %indvars.iv.next50.1.1, %wide.trip.count51.1
  br i1 %exitcond52.1.1, label %._crit_edge6.loopexit.unr-lcssa, label %._crit_edge7

._crit_edge6.loopexit.unr-lcssa:                  ; preds = %._crit_edge7
  br label %._crit_edge6.loopexit

._crit_edge6.loopexit:                            ; preds = %._crit_edge7.prol.loopexit147, %._crit_edge6.loopexit.unr-lcssa
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %._crit_edge7.prol.loopexit
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, %wide.trip.count57
  br i1 %exitcond58, label %._crit_edge6._crit_edge.loopexit143, label %.lr.ph12

._crit_edge6._crit_edge.loopexit:                 ; preds = %._crit_edge6.us
  br label %._crit_edge6._crit_edge

._crit_edge6._crit_edge.loopexit143:              ; preds = %._crit_edge6
  br label %._crit_edge6._crit_edge

._crit_edge6._crit_edge:                          ; preds = %._crit_edge6._crit_edge.loopexit143, %._crit_edge6._crit_edge.loopexit, %._crit_edge5.preheader.lr.ph, %._crit_edge6.preheader
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.preheader.us.preheader, label %._crit_edge

._crit_edge.preheader.us.preheader:               ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count5 = zext i32 %0 to i64
  %wide.trip.count9 = zext i32 %0 to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv7 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next8, %._crit_edge._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv7, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge2.us, %._crit_edge.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge2.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %15, %10
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next, %wide.trip.count5
  br i1 %exitcond6, label %._crit_edge._crit_edge.us, label %10

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge2.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, %wide.trip.count9
  br i1 %exitcond10, label %._crit_edge.loopexit, label %._crit_edge.preheader.us

._crit_edge.loopexit:                             ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !2}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !4, !5}
!14 = distinct !{!14, !4, !5}
!15 = distinct !{!15, !16, !4, !5}
!16 = !{!"llvm.loop.unroll.runtime.disable"}
