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
  %indvars.iv9 = phi i64 [ 0, %4 ], [ %indvars.iv.next10, %22 ]
  %5 = trunc i64 %indvars.iv9 to i32
  %6 = sitofp i32 %5 to double
  %7 = insertelement <2 x double> undef, double %6, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %9

; <label>:9:                                      ; preds = %9, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %9 ]
  %10 = mul nuw nsw i64 %indvars.iv, %indvars.iv9
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv9, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv9
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
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next10, 1400
  br i1 %exitcond, label %23, label %._crit_edge

; <label>:23:                                     ; preds = %22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph127, label %._crit_edge90

.lr.ph127:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph127.split.us.preheader, label %.lr.ph127.split.preheader

.lr.ph127.split.preheader:                        ; preds = %.lr.ph127
  %10 = add i32 %0, -1
  %xtraiter199 = and i32 %0, 3
  %lcmp.mod200 = icmp eq i32 %xtraiter199, 0
  br i1 %lcmp.mod200, label %.lr.ph127.split.prol.loopexit, label %.lr.ph127.split.prol.preheader

.lr.ph127.split.prol.preheader:                   ; preds = %.lr.ph127.split.preheader
  %11 = fdiv double 0.000000e+00, %2
  br label %.lr.ph127.split.prol

.lr.ph127.split.prol:                             ; preds = %.lr.ph127.split.prol.preheader, %.lr.ph127.split.prol
  %indvars.iv195.prol = phi i64 [ %indvars.iv.next196.prol, %.lr.ph127.split.prol ], [ 0, %.lr.ph127.split.prol.preheader ]
  %prol.iter201 = phi i32 [ %prol.iter201.sub, %.lr.ph127.split.prol ], [ %xtraiter199, %.lr.ph127.split.prol.preheader ]
  %12 = getelementptr inbounds double, double* %5, i64 %indvars.iv195.prol
  store double %11, double* %12, align 8
  %indvars.iv.next196.prol = add nuw nsw i64 %indvars.iv195.prol, 1
  %prol.iter201.sub = add i32 %prol.iter201, -1
  %prol.iter201.cmp = icmp eq i32 %prol.iter201.sub, 0
  br i1 %prol.iter201.cmp, label %.lr.ph127.split.prol.loopexit.loopexit, label %.lr.ph127.split.prol, !llvm.loop !1

.lr.ph127.split.prol.loopexit.loopexit:           ; preds = %.lr.ph127.split.prol
  br label %.lr.ph127.split.prol.loopexit

.lr.ph127.split.prol.loopexit:                    ; preds = %.lr.ph127.split.prol.loopexit.loopexit, %.lr.ph127.split.preheader
  %indvars.iv195.unr = phi i64 [ 0, %.lr.ph127.split.preheader ], [ %indvars.iv.next196.prol, %.lr.ph127.split.prol.loopexit.loopexit ]
  %13 = icmp ult i32 %10, 3
  br i1 %13, label %.lr.ph120, label %.lr.ph127.split.preheader207

.lr.ph127.split.preheader207:                     ; preds = %.lr.ph127.split.prol.loopexit
  %14 = fdiv double 0.000000e+00, %2
  %wide.trip.count197.3 = zext i32 %0 to i64
  %15 = add nsw i64 %wide.trip.count197.3, -4
  %16 = sub i64 %15, %indvars.iv195.unr
  %17 = lshr i64 %16, 2
  %18 = add nuw nsw i64 %17, 1
  %min.iters.check = icmp ult i64 %18, 4
  br i1 %min.iters.check, label %.lr.ph127.split.preheader226, label %min.iters.checked

.lr.ph127.split.preheader226:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph127.split.preheader207
  %indvars.iv195.ph = phi i64 [ %indvars.iv195.unr, %min.iters.checked ], [ %indvars.iv195.unr, %.lr.ph127.split.preheader207 ], [ %ind.end, %middle.block ]
  br label %.lr.ph127.split

min.iters.checked:                                ; preds = %.lr.ph127.split.preheader207
  %n.mod.vf = and i64 %18, 3
  %n.vec = sub nsw i64 %18, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %19 = shl nuw i64 %17, 2
  %20 = add i64 %indvars.iv195.unr, %19
  %21 = add i64 %20, 4
  %22 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %21, %22
  br i1 %cmp.zero, label %.lr.ph127.split.preheader226, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert214 = insertelement <2 x double> undef, double %14, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert214, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %23 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv195.unr, %23
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
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph127.split.preheader226

.lr.ph127.split.us.preheader:                     ; preds = %.lr.ph127
  %33 = add i32 %1, -1
  %xtraiter188 = and i32 %1, 3
  %lcmp.mod189 = icmp eq i32 %xtraiter188, 0
  %34 = icmp ult i32 %33, 3
  %wide.trip.count193 = zext i32 %0 to i64
  %wide.trip.count184.3 = zext i32 %1 to i64
  br label %.lr.ph127.split.us

.lr.ph127.split.us:                               ; preds = %._crit_edge124.us, %.lr.ph127.split.us.preheader
  %indvars.iv191 = phi i64 [ 0, %.lr.ph127.split.us.preheader ], [ %indvars.iv.next192, %._crit_edge124.us ]
  %35 = getelementptr inbounds double, double* %5, i64 %indvars.iv191
  store double 0.000000e+00, double* %35, align 8
  br i1 %lcmp.mod189, label %.prol.loopexit187, label %.prol.preheader186.preheader

.prol.preheader186.preheader:                     ; preds = %.lr.ph127.split.us
  br label %.prol.preheader186

.prol.preheader186:                               ; preds = %.prol.preheader186.preheader, %.prol.preheader186
  %36 = phi double [ %39, %.prol.preheader186 ], [ 0.000000e+00, %.prol.preheader186.preheader ]
  %indvars.iv182.prol = phi i64 [ %indvars.iv.next183.prol, %.prol.preheader186 ], [ 0, %.prol.preheader186.preheader ]
  %prol.iter190 = phi i32 [ %prol.iter190.sub, %.prol.preheader186 ], [ %xtraiter188, %.prol.preheader186.preheader ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv182.prol, i64 %indvars.iv191
  %38 = load double, double* %37, align 8
  %39 = fadd double %38, %36
  store double %39, double* %35, align 8
  %indvars.iv.next183.prol = add nuw nsw i64 %indvars.iv182.prol, 1
  %prol.iter190.sub = add i32 %prol.iter190, -1
  %prol.iter190.cmp = icmp eq i32 %prol.iter190.sub, 0
  br i1 %prol.iter190.cmp, label %.prol.loopexit187.loopexit, label %.prol.preheader186, !llvm.loop !6

.prol.loopexit187.loopexit:                       ; preds = %.prol.preheader186
  br label %.prol.loopexit187

.prol.loopexit187:                                ; preds = %.prol.loopexit187.loopexit, %.lr.ph127.split.us
  %40 = phi double [ 0.000000e+00, %.lr.ph127.split.us ], [ %39, %.prol.loopexit187.loopexit ]
  %indvars.iv182.unr = phi i64 [ 0, %.lr.ph127.split.us ], [ %indvars.iv.next183.prol, %.prol.loopexit187.loopexit ]
  br i1 %34, label %._crit_edge124.us, label %.lr.ph127.split.us.new.preheader

.lr.ph127.split.us.new.preheader:                 ; preds = %.prol.loopexit187
  br label %.lr.ph127.split.us.new

.lr.ph127.split.us.new:                           ; preds = %.lr.ph127.split.us.new.preheader, %.lr.ph127.split.us.new
  %41 = phi double [ %53, %.lr.ph127.split.us.new ], [ %40, %.lr.ph127.split.us.new.preheader ]
  %indvars.iv182 = phi i64 [ %indvars.iv.next183.3, %.lr.ph127.split.us.new ], [ %indvars.iv182.unr, %.lr.ph127.split.us.new.preheader ]
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv182, i64 %indvars.iv191
  %43 = load double, double* %42, align 8
  %44 = fadd double %43, %41
  store double %44, double* %35, align 8
  %indvars.iv.next183 = add nuw nsw i64 %indvars.iv182, 1
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next183, i64 %indvars.iv191
  %46 = load double, double* %45, align 8
  %47 = fadd double %46, %44
  store double %47, double* %35, align 8
  %indvars.iv.next183.1 = add nsw i64 %indvars.iv182, 2
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next183.1, i64 %indvars.iv191
  %49 = load double, double* %48, align 8
  %50 = fadd double %49, %47
  store double %50, double* %35, align 8
  %indvars.iv.next183.2 = add nsw i64 %indvars.iv182, 3
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next183.2, i64 %indvars.iv191
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  store double %53, double* %35, align 8
  %indvars.iv.next183.3 = add nsw i64 %indvars.iv182, 4
  %exitcond185.3 = icmp eq i64 %indvars.iv.next183.3, %wide.trip.count184.3
  br i1 %exitcond185.3, label %._crit_edge124.us.loopexit, label %.lr.ph127.split.us.new

._crit_edge124.us.loopexit:                       ; preds = %.lr.ph127.split.us.new
  br label %._crit_edge124.us

._crit_edge124.us:                                ; preds = %._crit_edge124.us.loopexit, %.prol.loopexit187
  %54 = phi double [ %40, %.prol.loopexit187 ], [ %53, %._crit_edge124.us.loopexit ]
  %55 = fdiv double %54, %2
  store double %55, double* %35, align 8
  %indvars.iv.next192 = add nuw nsw i64 %indvars.iv191, 1
  %exitcond194 = icmp eq i64 %indvars.iv.next192, %wide.trip.count193
  br i1 %exitcond194, label %._crit_edge.loopexit, label %.lr.ph127.split.us

._crit_edge.loopexit:                             ; preds = %._crit_edge124.us
  br label %._crit_edge

._crit_edge.loopexit227:                          ; preds = %.lr.ph127.split
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit227, %._crit_edge.loopexit, %middle.block
  br i1 true, label %.lr.ph120, label %._crit_edge.._crit_edge90_crit_edge

._crit_edge.._crit_edge90_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge90

.lr.ph120:                                        ; preds = %.lr.ph127.split.prol.loopexit, %._crit_edge
  br i1 %9, label %.lr.ph120.split.us.preheader, label %.lr.ph120.split.preheader

.lr.ph120.split.us.preheader:                     ; preds = %.lr.ph120
  %xtraiter170 = and i32 %1, 1
  %lcmp.mod171 = icmp eq i32 %xtraiter170, 0
  %56 = icmp eq i32 %1, 1
  %wide.trip.count174 = zext i32 %0 to i64
  %wide.trip.count166.1 = zext i32 %1 to i64
  br label %.lr.ph120.split.us

.lr.ph120.split.preheader:                        ; preds = %.lr.ph120
  %xtraiter180 = and i32 %0, 1
  %lcmp.mod181 = icmp eq i32 %xtraiter180, 0
  br i1 %lcmp.mod181, label %.lr.ph120.split.prol.loopexit, label %.lr.ph120.split.prol

.lr.ph120.split.prol:                             ; preds = %.lr.ph120.split.preheader
  %57 = fdiv double 0.000000e+00, %2
  store double %57, double* %6, align 8
  %58 = tail call double @sqrt(double %57) #4
  %59 = fcmp ugt double %58, 1.000000e-01
  %60 = select i1 %59, double %58, double 1.000000e+00
  store double %60, double* %6, align 8
  br label %.lr.ph120.split.prol.loopexit

.lr.ph120.split.prol.loopexit:                    ; preds = %.lr.ph120.split.preheader, %.lr.ph120.split.prol
  %indvars.iv176.unr = phi i64 [ 0, %.lr.ph120.split.preheader ], [ 1, %.lr.ph120.split.prol ]
  %61 = icmp eq i32 %0, 1
  br i1 %61, label %._crit_edge90, label %.lr.ph120.split.preheader205

.lr.ph120.split.preheader205:                     ; preds = %.lr.ph120.split.prol.loopexit
  %62 = fdiv double 0.000000e+00, %2
  %wide.trip.count178.1 = zext i32 %0 to i64
  br label %.lr.ph120.split

.lr.ph120.split.us:                               ; preds = %.lr.ph120.split.us.preheader, %._crit_edge118.us
  %indvars.iv172 = phi i64 [ %indvars.iv.next173, %._crit_edge118.us ], [ 0, %.lr.ph120.split.us.preheader ]
  %63 = getelementptr inbounds double, double* %6, i64 %indvars.iv172
  store double 0.000000e+00, double* %63, align 8
  %64 = getelementptr inbounds double, double* %5, i64 %indvars.iv172
  br i1 %lcmp.mod171, label %.prol.loopexit169, label %.prol.preheader168

.prol.preheader168:                               ; preds = %.lr.ph120.split.us
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv172
  %66 = load double, double* %65, align 8
  %67 = load double, double* %64, align 8
  %68 = fsub double %66, %67
  %69 = fmul double %68, %68
  %70 = fadd double %69, 0.000000e+00
  store double %70, double* %63, align 8
  br label %.prol.loopexit169

.prol.loopexit169:                                ; preds = %.prol.preheader168, %.lr.ph120.split.us
  %71 = phi double [ %70, %.prol.preheader168 ], [ 0.000000e+00, %.lr.ph120.split.us ]
  %indvars.iv164.unr.ph = phi i64 [ 1, %.prol.preheader168 ], [ 0, %.lr.ph120.split.us ]
  br i1 %56, label %._crit_edge118.us, label %.lr.ph120.split.us.new.preheader

.lr.ph120.split.us.new.preheader:                 ; preds = %.prol.loopexit169
  br label %.lr.ph120.split.us.new

.lr.ph120.split.us.new:                           ; preds = %.lr.ph120.split.us.new.preheader, %.lr.ph120.split.us.new
  %72 = phi double [ %84, %.lr.ph120.split.us.new ], [ %71, %.lr.ph120.split.us.new.preheader ]
  %indvars.iv164 = phi i64 [ %indvars.iv.next165.1, %.lr.ph120.split.us.new ], [ %indvars.iv164.unr.ph, %.lr.ph120.split.us.new.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv164, i64 %indvars.iv172
  %74 = load double, double* %73, align 8
  %75 = load double, double* %64, align 8
  %76 = fsub double %74, %75
  %77 = fmul double %76, %76
  %78 = fadd double %72, %77
  store double %78, double* %63, align 8
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next165, i64 %indvars.iv172
  %80 = load double, double* %79, align 8
  %81 = load double, double* %64, align 8
  %82 = fsub double %80, %81
  %83 = fmul double %82, %82
  %84 = fadd double %78, %83
  store double %84, double* %63, align 8
  %indvars.iv.next165.1 = add nsw i64 %indvars.iv164, 2
  %exitcond167.1 = icmp eq i64 %indvars.iv.next165.1, %wide.trip.count166.1
  br i1 %exitcond167.1, label %._crit_edge118.us.loopexit, label %.lr.ph120.split.us.new

._crit_edge118.us.loopexit:                       ; preds = %.lr.ph120.split.us.new
  br label %._crit_edge118.us

._crit_edge118.us:                                ; preds = %._crit_edge118.us.loopexit, %.prol.loopexit169
  %85 = phi double [ %71, %.prol.loopexit169 ], [ %84, %._crit_edge118.us.loopexit ]
  %86 = fdiv double %85, %2
  store double %86, double* %63, align 8
  %87 = tail call double @sqrt(double %86) #4
  %88 = fcmp ugt double %87, 1.000000e-01
  %89 = select i1 %88, double %87, double 1.000000e+00
  store double %89, double* %63, align 8
  %indvars.iv.next173 = add nuw nsw i64 %indvars.iv172, 1
  %exitcond175 = icmp eq i64 %indvars.iv.next173, %wide.trip.count174
  br i1 %exitcond175, label %._crit_edge90.loopexit, label %.lr.ph120.split.us

.lr.ph127.split:                                  ; preds = %.lr.ph127.split.preheader226, %.lr.ph127.split
  %indvars.iv195 = phi i64 [ %indvars.iv.next196.3, %.lr.ph127.split ], [ %indvars.iv195.ph, %.lr.ph127.split.preheader226 ]
  %90 = getelementptr inbounds double, double* %5, i64 %indvars.iv195
  store double %14, double* %90, align 8
  %indvars.iv.next196 = add nuw nsw i64 %indvars.iv195, 1
  %91 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next196
  store double %14, double* %91, align 8
  %indvars.iv.next196.1 = add nsw i64 %indvars.iv195, 2
  %92 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next196.1
  store double %14, double* %92, align 8
  %indvars.iv.next196.2 = add nsw i64 %indvars.iv195, 3
  %93 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next196.2
  store double %14, double* %93, align 8
  %indvars.iv.next196.3 = add nsw i64 %indvars.iv195, 4
  %exitcond198.3 = icmp eq i64 %indvars.iv.next196.3, %wide.trip.count197.3
  br i1 %exitcond198.3, label %._crit_edge.loopexit227, label %.lr.ph127.split, !llvm.loop !7

._crit_edge90.loopexit:                           ; preds = %._crit_edge118.us
  br label %._crit_edge90

._crit_edge90.loopexit225:                        ; preds = %.lr.ph120.split
  br label %._crit_edge90

._crit_edge90:                                    ; preds = %._crit_edge90.loopexit225, %._crit_edge90.loopexit, %._crit_edge.._crit_edge90_crit_edge, %7, %.lr.ph120.split.prol.loopexit
  %94 = icmp sgt i32 %1, 0
  br i1 %94, label %._crit_edge91.lr.ph, label %._crit_edge92

._crit_edge91.lr.ph:                              ; preds = %._crit_edge90
  br i1 %8, label %._crit_edge91.us.preheader, label %._crit_edge92.thread

._crit_edge91.us.preheader:                       ; preds = %._crit_edge91.lr.ph
  %wide.trip.count157 = zext i32 %0 to i64
  %wide.trip.count161 = zext i32 %1 to i64
  br label %._crit_edge91.us

._crit_edge92.thread:                             ; preds = %._crit_edge91.lr.ph
  %95 = add nsw i32 %0, -1
  br label %._crit_edge103

._crit_edge91.us:                                 ; preds = %._crit_edge91.us.preheader, %._crit_edge113.us
  %indvars.iv159 = phi i64 [ %indvars.iv.next160, %._crit_edge113.us ], [ 0, %._crit_edge91.us.preheader ]
  br label %96

; <label>:96:                                     ; preds = %96, %._crit_edge91.us
  %indvars.iv155 = phi i64 [ 0, %._crit_edge91.us ], [ %indvars.iv.next156, %96 ]
  %97 = getelementptr inbounds double, double* %5, i64 %indvars.iv155
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv159, i64 %indvars.iv155
  %100 = load double, double* %99, align 8
  %101 = fsub double %100, %98
  store double %101, double* %99, align 8
  %102 = tail call double @sqrt(double %2) #4
  %103 = getelementptr inbounds double, double* %6, i64 %indvars.iv155
  %104 = load double, double* %103, align 8
  %105 = fmul double %102, %104
  %106 = load double, double* %99, align 8
  %107 = fdiv double %106, %105
  store double %107, double* %99, align 8
  %indvars.iv.next156 = add nuw nsw i64 %indvars.iv155, 1
  %exitcond158 = icmp eq i64 %indvars.iv.next156, %wide.trip.count157
  br i1 %exitcond158, label %._crit_edge113.us, label %96

._crit_edge113.us:                                ; preds = %96
  %indvars.iv.next160 = add nuw nsw i64 %indvars.iv159, 1
  %exitcond162 = icmp eq i64 %indvars.iv.next160, %wide.trip.count161
  br i1 %exitcond162, label %._crit_edge92.loopexit, label %._crit_edge91.us

.lr.ph120.split:                                  ; preds = %.lr.ph120.split.preheader205, %.lr.ph120.split
  %indvars.iv176 = phi i64 [ %indvars.iv.next177.1, %.lr.ph120.split ], [ %indvars.iv176.unr, %.lr.ph120.split.preheader205 ]
  %108 = getelementptr inbounds double, double* %6, i64 %indvars.iv176
  store double %62, double* %108, align 8
  %109 = tail call double @sqrt(double %62) #4
  %110 = fcmp ugt double %109, 1.000000e-01
  %111 = select i1 %110, double %109, double 1.000000e+00
  store double %111, double* %108, align 8
  %indvars.iv.next177 = add nuw nsw i64 %indvars.iv176, 1
  %112 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next177
  store double %62, double* %112, align 8
  %113 = tail call double @sqrt(double %62) #4
  %114 = fcmp ugt double %113, 1.000000e-01
  %115 = select i1 %114, double %113, double 1.000000e+00
  store double %115, double* %112, align 8
  %indvars.iv.next177.1 = add nsw i64 %indvars.iv176, 2
  %exitcond179.1 = icmp eq i64 %indvars.iv.next177.1, %wide.trip.count178.1
  br i1 %exitcond179.1, label %._crit_edge90.loopexit225, label %.lr.ph120.split

._crit_edge92.loopexit:                           ; preds = %._crit_edge113.us
  br label %._crit_edge92

._crit_edge92:                                    ; preds = %._crit_edge92.loopexit, %._crit_edge90
  %116 = add nsw i32 %0, -1
  %117 = icmp sgt i32 %0, 1
  br i1 %117, label %.lr.ph102, label %._crit_edge103

.lr.ph102:                                        ; preds = %._crit_edge92
  br i1 %94, label %.lr.ph102.split.us.preheader, label %.lr.ph102.split.preheader

.lr.ph102.split.preheader:                        ; preds = %.lr.ph102
  %118 = zext i32 %116 to i64
  %119 = add i32 %0, -2
  %120 = zext i32 %119 to i64
  %121 = sext i32 %0 to i64
  %wide.trip.count146.3 = zext i32 %0 to i64
  br label %.lr.ph102.split

.lr.ph102.split.us.preheader:                     ; preds = %.lr.ph102
  %122 = sext i32 %0 to i64
  %wide.trip.count140 = zext i32 %116 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %123 = icmp eq i32 %1, 1
  %wide.trip.count136 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph102.split.us

.lr.ph102.split.us:                               ; preds = %._crit_edge100.us-lcssa.us.us, %.lr.ph102.split.us.preheader
  %indvars.iv138 = phi i64 [ 0, %.lr.ph102.split.us.preheader ], [ %indvars.iv.next139, %._crit_edge100.us-lcssa.us.us ]
  %indvars.iv132 = phi i64 [ 1, %.lr.ph102.split.us.preheader ], [ %indvars.iv.next133, %._crit_edge100.us-lcssa.us.us ]
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv138, i64 %indvars.iv138
  store double 1.000000e+00, double* %124, align 8
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %125 = icmp slt i64 %indvars.iv.next139, %122
  br i1 %125, label %.lr.ph.us.us.preheader, label %._crit_edge100.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph102.split.us
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv138
  br label %.lr.ph.us.us

._crit_edge100.us-lcssa.us.us.loopexit:           ; preds = %._crit_edge95.us.us
  br label %._crit_edge100.us-lcssa.us.us

._crit_edge100.us-lcssa.us.us:                    ; preds = %._crit_edge100.us-lcssa.us.us.loopexit, %.lr.ph102.split.us
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %exitcond141 = icmp eq i64 %indvars.iv.next139, %wide.trip.count140
  br i1 %exitcond141, label %._crit_edge103.loopexit, label %.lr.ph102.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge95.us.us
  %indvars.iv134 = phi i64 [ %indvars.iv.next135, %._crit_edge95.us.us ], [ %indvars.iv132, %.lr.ph.us.us.preheader ]
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv138, i64 %indvars.iv134
  store double 0.000000e+00, double* %127, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %128 = load double, double* %126, align 8
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv134
  %130 = load double, double* %129, align 8
  %131 = fmul double %128, %130
  %132 = fadd double %131, 0.000000e+00
  store double %132, double* %127, align 8
  %133 = bitcast double %132 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %134 = phi i64 [ %133, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %135 = phi double [ %132, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %123, label %._crit_edge95.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge95.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  %136 = bitcast double %152 to i64
  br label %._crit_edge95.us.us

._crit_edge95.us.us:                              ; preds = %._crit_edge95.us.us.loopexit, %.prol.loopexit
  %137 = phi i64 [ %134, %.prol.loopexit ], [ %136, %._crit_edge95.us.us.loopexit ]
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv134, i64 %indvars.iv138
  %139 = bitcast double* %138 to i64*
  store i64 %137, i64* %139, align 8
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %exitcond = icmp eq i64 %indvars.iv.next135, %wide.trip.count136
  br i1 %exitcond, label %._crit_edge100.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %140 = phi double [ %152, %.lr.ph.us.us.new ], [ %135, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv138
  %142 = load double, double* %141, align 8
  %143 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv134
  %144 = load double, double* %143, align 8
  %145 = fmul double %142, %144
  %146 = fadd double %140, %145
  store double %146, double* %127, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv138
  %148 = load double, double* %147, align 8
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv134
  %150 = load double, double* %149, align 8
  %151 = fmul double %148, %150
  %152 = fadd double %146, %151
  store double %152, double* %127, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge95.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph102.split:                                  ; preds = %._crit_edge100, %.lr.ph102.split.preheader
  %indvars.iv151 = phi i64 [ 0, %.lr.ph102.split.preheader ], [ %indvars.iv.next152, %._crit_edge100 ]
  %indvars.iv142 = phi i64 [ 1, %.lr.ph102.split.preheader ], [ %indvars.iv.next143, %._crit_edge100 ]
  %153 = sub i64 %120, %indvars.iv151
  %154 = trunc i64 %153 to i32
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv151
  store double 1.000000e+00, double* %155, align 8
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %156 = icmp slt i64 %indvars.iv.next152, %121
  br i1 %156, label %.lr.ph99.split.preheader, label %._crit_edge100

.lr.ph99.split.preheader:                         ; preds = %.lr.ph102.split
  %157 = sub i64 %118, %indvars.iv151
  %158 = trunc i64 %157 to i32
  %xtraiter149 = and i32 %158, 3
  %lcmp.mod150 = icmp eq i32 %xtraiter149, 0
  br i1 %lcmp.mod150, label %.lr.ph99.split.prol.loopexit, label %.lr.ph99.split.prol.preheader

.lr.ph99.split.prol.preheader:                    ; preds = %.lr.ph99.split.preheader
  br label %.lr.ph99.split.prol

.lr.ph99.split.prol:                              ; preds = %.lr.ph99.split.prol.preheader, %.lr.ph99.split.prol
  %indvars.iv144.prol = phi i64 [ %indvars.iv.next145.prol, %.lr.ph99.split.prol ], [ %indvars.iv142, %.lr.ph99.split.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph99.split.prol ], [ %xtraiter149, %.lr.ph99.split.prol.preheader ]
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv144.prol
  store double 0.000000e+00, double* %159, align 8
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv144.prol, i64 %indvars.iv151
  %161 = bitcast double* %160 to i64*
  store i64 0, i64* %161, align 8
  %indvars.iv.next145.prol = add nuw nsw i64 %indvars.iv144.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph99.split.prol.loopexit.loopexit, label %.lr.ph99.split.prol, !llvm.loop !9

.lr.ph99.split.prol.loopexit.loopexit:            ; preds = %.lr.ph99.split.prol
  br label %.lr.ph99.split.prol.loopexit

.lr.ph99.split.prol.loopexit:                     ; preds = %.lr.ph99.split.prol.loopexit.loopexit, %.lr.ph99.split.preheader
  %indvars.iv144.unr = phi i64 [ %indvars.iv142, %.lr.ph99.split.preheader ], [ %indvars.iv.next145.prol, %.lr.ph99.split.prol.loopexit.loopexit ]
  %162 = icmp ult i32 %154, 3
  br i1 %162, label %._crit_edge100, label %.lr.ph99.split.preheader223

.lr.ph99.split.preheader223:                      ; preds = %.lr.ph99.split.prol.loopexit
  br label %.lr.ph99.split

.lr.ph99.split:                                   ; preds = %.lr.ph99.split.preheader223, %.lr.ph99.split
  %indvars.iv144 = phi i64 [ %indvars.iv.next145.3, %.lr.ph99.split ], [ %indvars.iv144.unr, %.lr.ph99.split.preheader223 ]
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv144
  store double 0.000000e+00, double* %163, align 8
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv144, i64 %indvars.iv151
  %165 = bitcast double* %164 to i64*
  store i64 0, i64* %165, align 8
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv.next145
  store double 0.000000e+00, double* %166, align 8
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next145, i64 %indvars.iv151
  %168 = bitcast double* %167 to i64*
  store i64 0, i64* %168, align 8
  %indvars.iv.next145.1 = add nsw i64 %indvars.iv144, 2
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv.next145.1
  store double 0.000000e+00, double* %169, align 8
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next145.1, i64 %indvars.iv151
  %171 = bitcast double* %170 to i64*
  store i64 0, i64* %171, align 8
  %indvars.iv.next145.2 = add nsw i64 %indvars.iv144, 3
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv.next145.2
  store double 0.000000e+00, double* %172, align 8
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next145.2, i64 %indvars.iv151
  %174 = bitcast double* %173 to i64*
  store i64 0, i64* %174, align 8
  %indvars.iv.next145.3 = add nsw i64 %indvars.iv144, 4
  %exitcond147.3 = icmp eq i64 %indvars.iv.next145.3, %wide.trip.count146.3
  br i1 %exitcond147.3, label %._crit_edge100.loopexit, label %.lr.ph99.split

._crit_edge100.loopexit:                          ; preds = %.lr.ph99.split
  br label %._crit_edge100

._crit_edge100:                                   ; preds = %._crit_edge100.loopexit, %.lr.ph99.split.prol.loopexit, %.lr.ph102.split
  %indvars.iv.next143 = add nuw nsw i64 %indvars.iv142, 1
  %exitcond154 = icmp eq i64 %indvars.iv.next152, %118
  br i1 %exitcond154, label %._crit_edge103.loopexit224, label %.lr.ph102.split

._crit_edge103.loopexit:                          ; preds = %._crit_edge100.us-lcssa.us.us
  br label %._crit_edge103

._crit_edge103.loopexit224:                       ; preds = %._crit_edge100
  br label %._crit_edge103

._crit_edge103:                                   ; preds = %._crit_edge103.loopexit224, %._crit_edge103.loopexit, %._crit_edge92.thread, %._crit_edge92
  %175 = phi i32 [ %95, %._crit_edge92.thread ], [ %116, %._crit_edge92 ], [ %116, %._crit_edge103.loopexit ], [ %116, %._crit_edge103.loopexit224 ]
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %176, i64 %176
  store double 1.000000e+00, double* %177, align 8
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
  br i1 %7, label %._crit_edge.us.preheader, label %._crit_edge14

._crit_edge.us.preheader:                         ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge12.us, %._crit_edge.us.preheader
  %indvars.iv15 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next16, %._crit_edge12.us ]
  %9 = mul nsw i64 %indvars.iv15, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge10.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge10.us ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge10.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge12.us, label %10

._crit_edge12.us:                                 ; preds = %._crit_edge10.us
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, %wide.trip.count
  br i1 %exitcond18, label %._crit_edge14.loopexit, label %._crit_edge.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge12.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %2
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
