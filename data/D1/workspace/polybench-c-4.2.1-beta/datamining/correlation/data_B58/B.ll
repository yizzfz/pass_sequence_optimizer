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
  %indvars.iv8 = phi i64 [ 0, %4 ], [ %indvars.iv.next9, %22 ]
  %5 = trunc i64 %indvars.iv8 to i32
  %6 = sitofp i32 %5 to double
  %7 = insertelement <2 x double> undef, double %6, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %9

; <label>:9:                                      ; preds = %9, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %9 ]
  %10 = mul nuw nsw i64 %indvars.iv, %indvars.iv8
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv8, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv8
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
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, 1400
  br i1 %exitcond, label %23, label %._crit_edge

; <label>:23:                                     ; preds = %22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph127, label %._crit_edge89

.lr.ph127:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph127.split.us.preheader, label %.lr.ph127.split.preheader

.lr.ph127.split.preheader:                        ; preds = %.lr.ph127
  %10 = add i32 %0, -1
  %xtraiter205 = and i32 %0, 3
  %lcmp.mod206 = icmp eq i32 %xtraiter205, 0
  br i1 %lcmp.mod206, label %.lr.ph127.split.prol.loopexit, label %.lr.ph127.split.prol.preheader

.lr.ph127.split.prol.preheader:                   ; preds = %.lr.ph127.split.preheader
  %11 = fdiv double 0.000000e+00, %2
  br label %.lr.ph127.split.prol

.lr.ph127.split.prol:                             ; preds = %.lr.ph127.split.prol.preheader, %.lr.ph127.split.prol
  %indvars.iv201.prol = phi i64 [ %indvars.iv.next202.prol, %.lr.ph127.split.prol ], [ 0, %.lr.ph127.split.prol.preheader ]
  %prol.iter207 = phi i32 [ %prol.iter207.sub, %.lr.ph127.split.prol ], [ %xtraiter205, %.lr.ph127.split.prol.preheader ]
  %12 = getelementptr inbounds double, double* %5, i64 %indvars.iv201.prol
  store double %11, double* %12, align 8
  %indvars.iv.next202.prol = add nuw nsw i64 %indvars.iv201.prol, 1
  %prol.iter207.sub = add i32 %prol.iter207, -1
  %prol.iter207.cmp = icmp eq i32 %prol.iter207.sub, 0
  br i1 %prol.iter207.cmp, label %.lr.ph127.split.prol.loopexit.loopexit, label %.lr.ph127.split.prol, !llvm.loop !1

.lr.ph127.split.prol.loopexit.loopexit:           ; preds = %.lr.ph127.split.prol
  br label %.lr.ph127.split.prol.loopexit

.lr.ph127.split.prol.loopexit:                    ; preds = %.lr.ph127.split.prol.loopexit.loopexit, %.lr.ph127.split.preheader
  %indvars.iv201.unr = phi i64 [ 0, %.lr.ph127.split.preheader ], [ %indvars.iv.next202.prol, %.lr.ph127.split.prol.loopexit.loopexit ]
  %13 = icmp ult i32 %10, 3
  br i1 %13, label %._crit_edge, label %.lr.ph127.split.preheader211

.lr.ph127.split.preheader211:                     ; preds = %.lr.ph127.split.prol.loopexit
  %14 = fdiv double 0.000000e+00, %2
  %wide.trip.count203.3 = zext i32 %0 to i64
  %15 = add nsw i64 %wide.trip.count203.3, -4
  %16 = sub i64 %15, %indvars.iv201.unr
  %17 = lshr i64 %16, 2
  %18 = add nuw nsw i64 %17, 1
  %min.iters.check = icmp ult i64 %18, 4
  br i1 %min.iters.check, label %.lr.ph127.split.preheader236, label %min.iters.checked

.lr.ph127.split.preheader236:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph127.split.preheader211
  %indvars.iv201.ph = phi i64 [ %indvars.iv201.unr, %min.iters.checked ], [ %indvars.iv201.unr, %.lr.ph127.split.preheader211 ], [ %ind.end, %middle.block ]
  br label %.lr.ph127.split

min.iters.checked:                                ; preds = %.lr.ph127.split.preheader211
  %n.mod.vf = and i64 %18, 3
  %n.vec = sub nsw i64 %18, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %19 = shl nuw i64 %17, 2
  %20 = add i64 %indvars.iv201.unr, %19
  %21 = add i64 %20, 4
  %22 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %21, %22
  br i1 %cmp.zero, label %.lr.ph127.split.preheader236, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert225 = insertelement <2 x double> undef, double %14, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert225, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %23 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv201.unr, %23
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
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph127.split.preheader236

.lr.ph127.split.us.preheader:                     ; preds = %.lr.ph127
  %33 = add i32 %1, -1
  %xtraiter193 = and i32 %1, 3
  %lcmp.mod194 = icmp eq i32 %xtraiter193, 0
  %34 = icmp ult i32 %33, 3
  %wide.trip.count199 = zext i32 %0 to i64
  %wide.trip.count189.3 = zext i32 %1 to i64
  br label %.lr.ph127.split.us

.lr.ph127.split.us:                               ; preds = %._crit_edge124.us, %.lr.ph127.split.us.preheader
  %indvars.iv197 = phi i64 [ 0, %.lr.ph127.split.us.preheader ], [ %indvars.iv.next198, %._crit_edge124.us ]
  %35 = getelementptr inbounds double, double* %5, i64 %indvars.iv197
  store double 0.000000e+00, double* %35, align 8
  br i1 %lcmp.mod194, label %.prol.loopexit192, label %.prol.preheader191.preheader

.prol.preheader191.preheader:                     ; preds = %.lr.ph127.split.us
  br label %.prol.preheader191

.prol.preheader191:                               ; preds = %.prol.preheader191.preheader, %.prol.preheader191
  %indvars.iv187.prol = phi i64 [ %indvars.iv.next188.prol, %.prol.preheader191 ], [ 0, %.prol.preheader191.preheader ]
  %36 = phi double [ %39, %.prol.preheader191 ], [ 0.000000e+00, %.prol.preheader191.preheader ]
  %prol.iter195 = phi i32 [ %prol.iter195.sub, %.prol.preheader191 ], [ %xtraiter193, %.prol.preheader191.preheader ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv187.prol, i64 %indvars.iv197
  %38 = load double, double* %37, align 8
  %39 = fadd double %38, %36
  store double %39, double* %35, align 8
  %indvars.iv.next188.prol = add nuw nsw i64 %indvars.iv187.prol, 1
  %prol.iter195.sub = add i32 %prol.iter195, -1
  %prol.iter195.cmp = icmp eq i32 %prol.iter195.sub, 0
  br i1 %prol.iter195.cmp, label %.prol.loopexit192.loopexit, label %.prol.preheader191, !llvm.loop !6

.prol.loopexit192.loopexit:                       ; preds = %.prol.preheader191
  br label %.prol.loopexit192

.prol.loopexit192:                                ; preds = %.prol.loopexit192.loopexit, %.lr.ph127.split.us
  %indvars.iv187.unr = phi i64 [ 0, %.lr.ph127.split.us ], [ %indvars.iv.next188.prol, %.prol.loopexit192.loopexit ]
  %.unr196 = phi double [ 0.000000e+00, %.lr.ph127.split.us ], [ %39, %.prol.loopexit192.loopexit ]
  %.lcssa133.unr = phi double [ undef, %.lr.ph127.split.us ], [ %39, %.prol.loopexit192.loopexit ]
  br i1 %34, label %._crit_edge124.us, label %.lr.ph127.split.us.new.preheader

.lr.ph127.split.us.new.preheader:                 ; preds = %.prol.loopexit192
  br label %.lr.ph127.split.us.new

.lr.ph127.split.us.new:                           ; preds = %.lr.ph127.split.us.new.preheader, %.lr.ph127.split.us.new
  %indvars.iv187 = phi i64 [ %indvars.iv.next188.3, %.lr.ph127.split.us.new ], [ %indvars.iv187.unr, %.lr.ph127.split.us.new.preheader ]
  %40 = phi double [ %52, %.lr.ph127.split.us.new ], [ %.unr196, %.lr.ph127.split.us.new.preheader ]
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv187, i64 %indvars.iv197
  %42 = load double, double* %41, align 8
  %43 = fadd double %42, %40
  store double %43, double* %35, align 8
  %indvars.iv.next188 = add nuw nsw i64 %indvars.iv187, 1
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next188, i64 %indvars.iv197
  %45 = load double, double* %44, align 8
  %46 = fadd double %45, %43
  store double %46, double* %35, align 8
  %indvars.iv.next188.1 = add nsw i64 %indvars.iv187, 2
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next188.1, i64 %indvars.iv197
  %48 = load double, double* %47, align 8
  %49 = fadd double %48, %46
  store double %49, double* %35, align 8
  %indvars.iv.next188.2 = add nsw i64 %indvars.iv187, 3
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next188.2, i64 %indvars.iv197
  %51 = load double, double* %50, align 8
  %52 = fadd double %51, %49
  store double %52, double* %35, align 8
  %indvars.iv.next188.3 = add nsw i64 %indvars.iv187, 4
  %exitcond190.3 = icmp eq i64 %indvars.iv.next188.3, %wide.trip.count189.3
  br i1 %exitcond190.3, label %._crit_edge124.us.loopexit, label %.lr.ph127.split.us.new

._crit_edge124.us.loopexit:                       ; preds = %.lr.ph127.split.us.new
  br label %._crit_edge124.us

._crit_edge124.us:                                ; preds = %._crit_edge124.us.loopexit, %.prol.loopexit192
  %.lcssa133 = phi double [ %.lcssa133.unr, %.prol.loopexit192 ], [ %52, %._crit_edge124.us.loopexit ]
  %53 = fdiv double %.lcssa133, %2
  store double %53, double* %35, align 8
  %indvars.iv.next198 = add nuw nsw i64 %indvars.iv197, 1
  %exitcond200 = icmp eq i64 %indvars.iv.next198, %wide.trip.count199
  br i1 %exitcond200, label %._crit_edge.loopexit, label %.lr.ph127.split.us

._crit_edge.loopexit:                             ; preds = %._crit_edge124.us
  br label %._crit_edge

._crit_edge.loopexit237:                          ; preds = %.lr.ph127.split
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit237, %._crit_edge.loopexit, %middle.block, %.lr.ph127.split.prol.loopexit
  br i1 true, label %.lr.ph120, label %._crit_edge.._crit_edge89_crit_edge

._crit_edge.._crit_edge89_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge89

.lr.ph120:                                        ; preds = %._crit_edge
  br i1 %9, label %.lr.ph120.split.us.preheader, label %.lr.ph120.split.preheader

.lr.ph120.split.us.preheader:                     ; preds = %.lr.ph120
  %xtraiter174 = and i32 %1, 1
  %lcmp.mod175 = icmp eq i32 %xtraiter174, 0
  %54 = icmp eq i32 %1, 1
  %wide.trip.count179 = zext i32 %0 to i64
  %wide.trip.count170.1 = zext i32 %1 to i64
  br label %.lr.ph120.split.us

.lr.ph120.split.preheader:                        ; preds = %.lr.ph120
  %xtraiter185 = and i32 %0, 1
  %lcmp.mod186 = icmp eq i32 %xtraiter185, 0
  br i1 %lcmp.mod186, label %.lr.ph120.split.prol.loopexit, label %.lr.ph120.split.prol

.lr.ph120.split.prol:                             ; preds = %.lr.ph120.split.preheader
  %55 = fdiv double 0.000000e+00, %2
  store double %55, double* %6, align 8
  %56 = tail call double @sqrt(double %55) #4
  %57 = fcmp ugt double %56, 1.000000e-01
  %58 = select i1 %57, double %56, double 1.000000e+00
  store double %58, double* %6, align 8
  br label %.lr.ph120.split.prol.loopexit

.lr.ph120.split.prol.loopexit:                    ; preds = %.lr.ph120.split.preheader, %.lr.ph120.split.prol
  %indvars.iv181.unr = phi i64 [ 0, %.lr.ph120.split.preheader ], [ 1, %.lr.ph120.split.prol ]
  %59 = icmp eq i32 %0, 1
  br i1 %59, label %._crit_edge89, label %.lr.ph120.split.preheader209

.lr.ph120.split.preheader209:                     ; preds = %.lr.ph120.split.prol.loopexit
  %60 = fdiv double 0.000000e+00, %2
  %wide.trip.count183.1 = zext i32 %0 to i64
  br label %.lr.ph120.split

.lr.ph120.split.us:                               ; preds = %.lr.ph120.split.us.preheader, %._crit_edge118.us
  %indvars.iv177 = phi i64 [ %indvars.iv.next178, %._crit_edge118.us ], [ 0, %.lr.ph120.split.us.preheader ]
  %61 = getelementptr inbounds double, double* %6, i64 %indvars.iv177
  store double 0.000000e+00, double* %61, align 8
  %62 = getelementptr inbounds double, double* %5, i64 %indvars.iv177
  br i1 %lcmp.mod175, label %.prol.loopexit173, label %.prol.preheader172

.prol.preheader172:                               ; preds = %.lr.ph120.split.us
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv177
  %64 = load double, double* %63, align 8
  %65 = load double, double* %62, align 8
  %66 = fsub double %64, %65
  %67 = fmul double %66, %66
  %68 = fadd double %67, 0.000000e+00
  store double %68, double* %61, align 8
  br label %.prol.loopexit173

.prol.loopexit173:                                ; preds = %.prol.preheader172, %.lr.ph120.split.us
  %indvars.iv168.unr.ph = phi i64 [ 1, %.prol.preheader172 ], [ 0, %.lr.ph120.split.us ]
  %.unr176.ph = phi double [ %68, %.prol.preheader172 ], [ 0.000000e+00, %.lr.ph120.split.us ]
  %.lcssa132.unr.ph = phi double [ %68, %.prol.preheader172 ], [ undef, %.lr.ph120.split.us ]
  br i1 %54, label %._crit_edge118.us, label %.lr.ph120.split.us.new.preheader

.lr.ph120.split.us.new.preheader:                 ; preds = %.prol.loopexit173
  br label %.lr.ph120.split.us.new

.lr.ph120.split.us.new:                           ; preds = %.lr.ph120.split.us.new.preheader, %.lr.ph120.split.us.new
  %indvars.iv168 = phi i64 [ %indvars.iv.next169.1, %.lr.ph120.split.us.new ], [ %indvars.iv168.unr.ph, %.lr.ph120.split.us.new.preheader ]
  %69 = phi double [ %81, %.lr.ph120.split.us.new ], [ %.unr176.ph, %.lr.ph120.split.us.new.preheader ]
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv168, i64 %indvars.iv177
  %71 = load double, double* %70, align 8
  %72 = load double, double* %62, align 8
  %73 = fsub double %71, %72
  %74 = fmul double %73, %73
  %75 = fadd double %69, %74
  store double %75, double* %61, align 8
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next169, i64 %indvars.iv177
  %77 = load double, double* %76, align 8
  %78 = load double, double* %62, align 8
  %79 = fsub double %77, %78
  %80 = fmul double %79, %79
  %81 = fadd double %75, %80
  store double %81, double* %61, align 8
  %indvars.iv.next169.1 = add nsw i64 %indvars.iv168, 2
  %exitcond171.1 = icmp eq i64 %indvars.iv.next169.1, %wide.trip.count170.1
  br i1 %exitcond171.1, label %._crit_edge118.us.loopexit, label %.lr.ph120.split.us.new

._crit_edge118.us.loopexit:                       ; preds = %.lr.ph120.split.us.new
  br label %._crit_edge118.us

._crit_edge118.us:                                ; preds = %._crit_edge118.us.loopexit, %.prol.loopexit173
  %.lcssa132 = phi double [ %.lcssa132.unr.ph, %.prol.loopexit173 ], [ %81, %._crit_edge118.us.loopexit ]
  %82 = fdiv double %.lcssa132, %2
  store double %82, double* %61, align 8
  %83 = tail call double @sqrt(double %82) #4
  %84 = fcmp ugt double %83, 1.000000e-01
  %85 = select i1 %84, double %83, double 1.000000e+00
  store double %85, double* %61, align 8
  %indvars.iv.next178 = add nuw nsw i64 %indvars.iv177, 1
  %exitcond180 = icmp eq i64 %indvars.iv.next178, %wide.trip.count179
  br i1 %exitcond180, label %._crit_edge89.loopexit, label %.lr.ph120.split.us

.lr.ph127.split:                                  ; preds = %.lr.ph127.split.preheader236, %.lr.ph127.split
  %indvars.iv201 = phi i64 [ %indvars.iv.next202.3, %.lr.ph127.split ], [ %indvars.iv201.ph, %.lr.ph127.split.preheader236 ]
  %86 = getelementptr inbounds double, double* %5, i64 %indvars.iv201
  store double %14, double* %86, align 8
  %indvars.iv.next202 = add nuw nsw i64 %indvars.iv201, 1
  %87 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next202
  store double %14, double* %87, align 8
  %indvars.iv.next202.1 = add nsw i64 %indvars.iv201, 2
  %88 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next202.1
  store double %14, double* %88, align 8
  %indvars.iv.next202.2 = add nsw i64 %indvars.iv201, 3
  %89 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next202.2
  store double %14, double* %89, align 8
  %indvars.iv.next202.3 = add nsw i64 %indvars.iv201, 4
  %exitcond204.3 = icmp eq i64 %indvars.iv.next202.3, %wide.trip.count203.3
  br i1 %exitcond204.3, label %._crit_edge.loopexit237, label %.lr.ph127.split, !llvm.loop !7

._crit_edge89.loopexit:                           ; preds = %._crit_edge118.us
  br label %._crit_edge89

._crit_edge89.loopexit235:                        ; preds = %.lr.ph120.split
  br label %._crit_edge89

._crit_edge89:                                    ; preds = %._crit_edge89.loopexit235, %._crit_edge89.loopexit, %._crit_edge.._crit_edge89_crit_edge, %7, %.lr.ph120.split.prol.loopexit
  %90 = icmp sgt i32 %1, 0
  br i1 %90, label %._crit_edge91.lr.ph, label %._crit_edge92

._crit_edge91.lr.ph:                              ; preds = %._crit_edge89
  br i1 %8, label %._crit_edge91.us.preheader, label %._crit_edge92.thread

._crit_edge91.us.preheader:                       ; preds = %._crit_edge91.lr.ph
  %wide.trip.count161 = zext i32 %0 to i64
  %wide.trip.count165 = zext i32 %1 to i64
  br label %._crit_edge91.us

._crit_edge92.thread:                             ; preds = %._crit_edge91.lr.ph
  %91 = add nsw i32 %0, -1
  br label %._crit_edge103

._crit_edge91.us:                                 ; preds = %._crit_edge91.us.preheader, %._crit_edge113.us
  %indvars.iv163 = phi i64 [ %indvars.iv.next164, %._crit_edge113.us ], [ 0, %._crit_edge91.us.preheader ]
  br label %92

; <label>:92:                                     ; preds = %92, %._crit_edge91.us
  %indvars.iv159 = phi i64 [ 0, %._crit_edge91.us ], [ %indvars.iv.next160, %92 ]
  %93 = getelementptr inbounds double, double* %5, i64 %indvars.iv159
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv163, i64 %indvars.iv159
  %96 = load double, double* %95, align 8
  %97 = fsub double %96, %94
  store double %97, double* %95, align 8
  %98 = tail call double @sqrt(double %2) #4
  %99 = getelementptr inbounds double, double* %6, i64 %indvars.iv159
  %100 = load double, double* %99, align 8
  %101 = fmul double %98, %100
  %102 = load double, double* %95, align 8
  %103 = fdiv double %102, %101
  store double %103, double* %95, align 8
  %indvars.iv.next160 = add nuw nsw i64 %indvars.iv159, 1
  %exitcond162 = icmp eq i64 %indvars.iv.next160, %wide.trip.count161
  br i1 %exitcond162, label %._crit_edge113.us, label %92

._crit_edge113.us:                                ; preds = %92
  %indvars.iv.next164 = add nuw nsw i64 %indvars.iv163, 1
  %exitcond166 = icmp eq i64 %indvars.iv.next164, %wide.trip.count165
  br i1 %exitcond166, label %._crit_edge92.loopexit, label %._crit_edge91.us

.lr.ph120.split:                                  ; preds = %.lr.ph120.split.preheader209, %.lr.ph120.split
  %indvars.iv181 = phi i64 [ %indvars.iv.next182.1, %.lr.ph120.split ], [ %indvars.iv181.unr, %.lr.ph120.split.preheader209 ]
  %104 = getelementptr inbounds double, double* %6, i64 %indvars.iv181
  store double %60, double* %104, align 8
  %105 = tail call double @sqrt(double %60) #4
  %106 = fcmp ugt double %105, 1.000000e-01
  %107 = select i1 %106, double %105, double 1.000000e+00
  store double %107, double* %104, align 8
  %indvars.iv.next182 = add nuw nsw i64 %indvars.iv181, 1
  %108 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next182
  store double %60, double* %108, align 8
  %109 = tail call double @sqrt(double %60) #4
  %110 = fcmp ugt double %109, 1.000000e-01
  %111 = select i1 %110, double %109, double 1.000000e+00
  store double %111, double* %108, align 8
  %indvars.iv.next182.1 = add nsw i64 %indvars.iv181, 2
  %exitcond184.1 = icmp eq i64 %indvars.iv.next182.1, %wide.trip.count183.1
  br i1 %exitcond184.1, label %._crit_edge89.loopexit235, label %.lr.ph120.split

._crit_edge92.loopexit:                           ; preds = %._crit_edge113.us
  br label %._crit_edge92

._crit_edge92:                                    ; preds = %._crit_edge92.loopexit, %._crit_edge89
  %112 = add nsw i32 %0, -1
  %113 = icmp sgt i32 %0, 1
  br i1 %113, label %.lr.ph102, label %._crit_edge103

.lr.ph102:                                        ; preds = %._crit_edge92
  br i1 %90, label %.lr.ph102.split.us.preheader, label %.lr.ph102.split.preheader

.lr.ph102.split.preheader:                        ; preds = %.lr.ph102
  %114 = zext i32 %112 to i64
  %115 = add i32 %0, -2
  %116 = zext i32 %115 to i64
  %117 = sext i32 %0 to i64
  %wide.trip.count148.3 = zext i32 %0 to i64
  br label %.lr.ph102.split

.lr.ph102.split.us.preheader:                     ; preds = %.lr.ph102
  %118 = sext i32 %0 to i64
  %wide.trip.count142 = zext i32 %112 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %119 = icmp eq i32 %1, 1
  %wide.trip.count138 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph102.split.us

.lr.ph102.split.us:                               ; preds = %._crit_edge100.us-lcssa.us.us, %.lr.ph102.split.us.preheader
  %indvars.iv140 = phi i64 [ 0, %.lr.ph102.split.us.preheader ], [ %indvars.iv.next141, %._crit_edge100.us-lcssa.us.us ]
  %indvars.iv134 = phi i64 [ 1, %.lr.ph102.split.us.preheader ], [ %indvars.iv.next135, %._crit_edge100.us-lcssa.us.us ]
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv140, i64 %indvars.iv140
  store double 1.000000e+00, double* %120, align 8
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %121 = icmp slt i64 %indvars.iv.next141, %118
  br i1 %121, label %.lr.ph.us.us.preheader, label %._crit_edge100.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph102.split.us
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv140
  br label %.lr.ph.us.us

._crit_edge100.us-lcssa.us.us.loopexit:           ; preds = %._crit_edge95.us.us
  br label %._crit_edge100.us-lcssa.us.us

._crit_edge100.us-lcssa.us.us:                    ; preds = %._crit_edge100.us-lcssa.us.us.loopexit, %.lr.ph102.split.us
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %exitcond143 = icmp eq i64 %indvars.iv.next141, %wide.trip.count142
  br i1 %exitcond143, label %._crit_edge103.loopexit, label %.lr.ph102.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge95.us.us
  %indvars.iv136 = phi i64 [ %indvars.iv.next137, %._crit_edge95.us.us ], [ %indvars.iv134, %.lr.ph.us.us.preheader ]
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv140, i64 %indvars.iv136
  store double 0.000000e+00, double* %123, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %124 = load double, double* %122, align 8
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv136
  %126 = load double, double* %125, align 8
  %127 = fmul double %124, %126
  %128 = fadd double %127, 0.000000e+00
  store double %128, double* %123, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %128, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %.lcssa.unr.ph = phi double [ %128, %.prol.preheader ], [ undef, %.lr.ph.us.us ]
  br i1 %119, label %._crit_edge95.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge95.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  br label %._crit_edge95.us.us

._crit_edge95.us.us:                              ; preds = %._crit_edge95.us.us.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %142, %._crit_edge95.us.us.loopexit ]
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv136, i64 %indvars.iv140
  store double %.lcssa, double* %129, align 8
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  %exitcond = icmp eq i64 %indvars.iv.next137, %wide.trip.count138
  br i1 %exitcond, label %._crit_edge100.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %130 = phi double [ %142, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv140
  %132 = load double, double* %131, align 8
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv136
  %134 = load double, double* %133, align 8
  %135 = fmul double %132, %134
  %136 = fadd double %130, %135
  store double %136, double* %123, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv140
  %138 = load double, double* %137, align 8
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv136
  %140 = load double, double* %139, align 8
  %141 = fmul double %138, %140
  %142 = fadd double %136, %141
  store double %142, double* %123, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge95.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph102.split:                                  ; preds = %._crit_edge100, %.lr.ph102.split.preheader
  %indvars.iv155 = phi i64 [ 0, %.lr.ph102.split.preheader ], [ %indvars.iv.next156, %._crit_edge100 ]
  %indvars.iv144 = phi i64 [ 1, %.lr.ph102.split.preheader ], [ %indvars.iv.next145, %._crit_edge100 ]
  %143 = sub i64 %116, %indvars.iv155
  %144 = trunc i64 %143 to i32
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv155, i64 %indvars.iv155
  store double 1.000000e+00, double* %145, align 8
  %indvars.iv.next156 = add nuw nsw i64 %indvars.iv155, 1
  %146 = icmp slt i64 %indvars.iv.next156, %117
  br i1 %146, label %.lr.ph99, label %._crit_edge100

.lr.ph99:                                         ; preds = %.lr.ph102.split
  %147 = sub i64 %114, %indvars.iv155
  %148 = trunc i64 %147 to i32
  %xtraiter153 = and i32 %148, 3
  %lcmp.mod154 = icmp eq i32 %xtraiter153, 0
  br i1 %lcmp.mod154, label %.prol.loopexit152, label %.prol.preheader151.preheader

.prol.preheader151.preheader:                     ; preds = %.lr.ph99
  br label %.prol.preheader151

.prol.preheader151:                               ; preds = %.prol.preheader151.preheader, %.prol.preheader151
  %indvars.iv146.prol = phi i64 [ %indvars.iv.next147.prol, %.prol.preheader151 ], [ %indvars.iv144, %.prol.preheader151.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader151 ], [ %xtraiter153, %.prol.preheader151.preheader ]
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv155, i64 %indvars.iv146.prol
  store double 0.000000e+00, double* %149, align 8
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv146.prol, i64 %indvars.iv155
  %151 = bitcast double* %150 to i64*
  store i64 0, i64* %151, align 8
  %indvars.iv.next147.prol = add nuw nsw i64 %indvars.iv146.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit152.loopexit, label %.prol.preheader151, !llvm.loop !9

.prol.loopexit152.loopexit:                       ; preds = %.prol.preheader151
  br label %.prol.loopexit152

.prol.loopexit152:                                ; preds = %.prol.loopexit152.loopexit, %.lr.ph99
  %indvars.iv146.unr = phi i64 [ %indvars.iv144, %.lr.ph99 ], [ %indvars.iv.next147.prol, %.prol.loopexit152.loopexit ]
  %152 = icmp ult i32 %144, 3
  br i1 %152, label %._crit_edge100, label %.lr.ph99.new.preheader

.lr.ph99.new.preheader:                           ; preds = %.prol.loopexit152
  br label %.lr.ph99.new

.lr.ph99.new:                                     ; preds = %.lr.ph99.new.preheader, %.lr.ph99.new
  %indvars.iv146 = phi i64 [ %indvars.iv.next147.3, %.lr.ph99.new ], [ %indvars.iv146.unr, %.lr.ph99.new.preheader ]
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv155, i64 %indvars.iv146
  store double 0.000000e+00, double* %153, align 8
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv146, i64 %indvars.iv155
  %155 = bitcast double* %154 to i64*
  store i64 0, i64* %155, align 8
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv155, i64 %indvars.iv.next147
  store double 0.000000e+00, double* %156, align 8
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next147, i64 %indvars.iv155
  %158 = bitcast double* %157 to i64*
  store i64 0, i64* %158, align 8
  %indvars.iv.next147.1 = add nsw i64 %indvars.iv146, 2
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv155, i64 %indvars.iv.next147.1
  store double 0.000000e+00, double* %159, align 8
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next147.1, i64 %indvars.iv155
  %161 = bitcast double* %160 to i64*
  store i64 0, i64* %161, align 8
  %indvars.iv.next147.2 = add nsw i64 %indvars.iv146, 3
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv155, i64 %indvars.iv.next147.2
  store double 0.000000e+00, double* %162, align 8
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next147.2, i64 %indvars.iv155
  %164 = bitcast double* %163 to i64*
  store i64 0, i64* %164, align 8
  %indvars.iv.next147.3 = add nsw i64 %indvars.iv146, 4
  %exitcond149.3 = icmp eq i64 %indvars.iv.next147.3, %wide.trip.count148.3
  br i1 %exitcond149.3, label %._crit_edge100.loopexit, label %.lr.ph99.new

._crit_edge100.loopexit:                          ; preds = %.lr.ph99.new
  br label %._crit_edge100

._crit_edge100:                                   ; preds = %._crit_edge100.loopexit, %.prol.loopexit152, %.lr.ph102.split
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %exitcond158 = icmp eq i64 %indvars.iv.next156, %114
  br i1 %exitcond158, label %._crit_edge103.loopexit234, label %.lr.ph102.split

._crit_edge103.loopexit:                          ; preds = %._crit_edge100.us-lcssa.us.us
  br label %._crit_edge103

._crit_edge103.loopexit234:                       ; preds = %._crit_edge100
  br label %._crit_edge103

._crit_edge103:                                   ; preds = %._crit_edge103.loopexit234, %._crit_edge103.loopexit, %._crit_edge92.thread, %._crit_edge92
  %165 = phi i32 [ %91, %._crit_edge92.thread ], [ %112, %._crit_edge92 ], [ %112, %._crit_edge103.loopexit ], [ %112, %._crit_edge103.loopexit234 ]
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %166, i64 %166
  store double 1.000000e+00, double* %167, align 8
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
  br i1 %7, label %._crit_edge.us.preheader, label %._crit_edge13

._crit_edge.us.preheader:                         ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge11.us, %._crit_edge.us.preheader
  %indvars.iv14 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next15, %._crit_edge11.us ]
  %9 = mul nsw i64 %indvars.iv14, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge9.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge9.us ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge9.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge11.us, label %10

._crit_edge11.us:                                 ; preds = %._crit_edge9.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count
  br i1 %exitcond17, label %._crit_edge13.loopexit, label %._crit_edge.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %2
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
