; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  call void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  call void @print_array(i32 1200, [1200 x double]* %10)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double*, [1200 x double]*) #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %.preheader

.preheader:                                       ; preds = %20, %4
  %indvars.iv12 = phi i64 [ 0, %4 ], [ %indvars.iv.next13, %20 ]
  %5 = trunc i64 %indvars.iv12 to i32
  %6 = sitofp i32 %5 to double
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv, %indvars.iv12
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.200000e+03
  %12 = fadd double %6, %11
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv12, i64 %indvars.iv
  store double %12, double* %13, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv12
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.200000e+03
  %18 = fadd double %6, %17
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv12, i64 %indvars.iv.next
  store double %18, double* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next13, 1400
  br i1 %exitcond, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_correlation(i32, i32, double, [1200 x double]*, [1200 x double]*, double*, double*) #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph136, label %.preheader105

.lr.ph136:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph136.split.us.preheader, label %.lr.ph136.split.preheader

.lr.ph136.split.preheader:                        ; preds = %.lr.ph136
  %10 = add i32 %0, -1
  %xtraiter208 = and i32 %0, 3
  %lcmp.mod209 = icmp eq i32 %xtraiter208, 0
  br i1 %lcmp.mod209, label %.lr.ph136.split.prol.loopexit, label %.lr.ph136.split.prol.preheader

.lr.ph136.split.prol.preheader:                   ; preds = %.lr.ph136.split.preheader
  %11 = fdiv double 0.000000e+00, %2
  br label %.lr.ph136.split.prol

.lr.ph136.split.prol:                             ; preds = %.lr.ph136.split.prol.preheader, %.lr.ph136.split.prol
  %indvars.iv204.prol = phi i64 [ %indvars.iv.next205.prol, %.lr.ph136.split.prol ], [ 0, %.lr.ph136.split.prol.preheader ]
  %prol.iter210 = phi i32 [ %prol.iter210.sub, %.lr.ph136.split.prol ], [ %xtraiter208, %.lr.ph136.split.prol.preheader ]
  %12 = getelementptr inbounds double, double* %5, i64 %indvars.iv204.prol
  store double %11, double* %12, align 8
  %indvars.iv.next205.prol = add nuw nsw i64 %indvars.iv204.prol, 1
  %prol.iter210.sub = add i32 %prol.iter210, -1
  %prol.iter210.cmp = icmp eq i32 %prol.iter210.sub, 0
  br i1 %prol.iter210.cmp, label %.lr.ph136.split.prol.loopexit.loopexit, label %.lr.ph136.split.prol, !llvm.loop !1

.lr.ph136.split.prol.loopexit.loopexit:           ; preds = %.lr.ph136.split.prol
  br label %.lr.ph136.split.prol.loopexit

.lr.ph136.split.prol.loopexit:                    ; preds = %.lr.ph136.split.prol.loopexit.loopexit, %.lr.ph136.split.preheader
  %indvars.iv204.unr = phi i64 [ 0, %.lr.ph136.split.preheader ], [ %indvars.iv.next205.prol, %.lr.ph136.split.prol.loopexit.loopexit ]
  %13 = icmp ult i32 %10, 3
  br i1 %13, label %.lr.ph129, label %.lr.ph136.split.preheader216

.lr.ph136.split.preheader216:                     ; preds = %.lr.ph136.split.prol.loopexit
  %14 = fdiv double 0.000000e+00, %2
  %15 = fdiv double 0.000000e+00, %2
  %16 = fdiv double 0.000000e+00, %2
  %17 = fdiv double 0.000000e+00, %2
  %wide.trip.count206.3 = zext i32 %0 to i64
  %18 = add nsw i64 %wide.trip.count206.3, -4
  %19 = sub i64 %18, %indvars.iv204.unr
  %20 = lshr i64 %19, 2
  %21 = add nuw nsw i64 %20, 1
  %min.iters.check = icmp ult i64 %21, 4
  br i1 %min.iters.check, label %.lr.ph136.split.preheader235, label %min.iters.checked

.lr.ph136.split.preheader235:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph136.split.preheader216
  %indvars.iv204.ph = phi i64 [ %indvars.iv204.unr, %min.iters.checked ], [ %indvars.iv204.unr, %.lr.ph136.split.preheader216 ], [ %ind.end, %middle.block ]
  br label %.lr.ph136.split

min.iters.checked:                                ; preds = %.lr.ph136.split.preheader216
  %n.mod.vf = and i64 %21, 3
  %n.vec = sub nsw i64 %21, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %22 = shl nuw i64 %20, 2
  %23 = add i64 %indvars.iv204.unr, %22
  %24 = add i64 %23, 4
  %25 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %24, %25
  br i1 %cmp.zero, label %.lr.ph136.split.preheader235, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert223 = insertelement <2 x double> undef, double %14, i32 0
  %broadcast.splat224 = shufflevector <2 x double> %broadcast.splatinsert223, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert225 = insertelement <2 x double> undef, double %15, i32 0
  %broadcast.splat226 = shufflevector <2 x double> %broadcast.splatinsert225, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert227 = insertelement <2 x double> undef, double %16, i32 0
  %broadcast.splat228 = shufflevector <2 x double> %broadcast.splatinsert227, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert229 = insertelement <2 x double> undef, double %17, i32 0
  %broadcast.splat230 = shufflevector <2 x double> %broadcast.splatinsert229, <2 x double> undef, <2 x i32> zeroinitializer
  %26 = shufflevector <2 x double> %broadcast.splat224, <2 x double> %broadcast.splat226, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %27 = shufflevector <2 x double> %broadcast.splat228, <2 x double> %broadcast.splat230, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %26, <4 x double> %27, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %28 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv204.unr, %28
  %29 = add i64 %indvars.iv204.unr, %28
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
  br i1 %cmp.n, label %.preheader106, label %.lr.ph136.split.preheader235

.lr.ph136.split.us.preheader:                     ; preds = %.lr.ph136
  %39 = add i32 %1, -1
  %xtraiter197 = and i32 %1, 3
  %lcmp.mod198 = icmp eq i32 %xtraiter197, 0
  %40 = icmp ult i32 %39, 3
  %wide.trip.count202 = zext i32 %0 to i64
  %wide.trip.count193.3 = zext i32 %1 to i64
  br label %.lr.ph136.split.us

.lr.ph136.split.us:                               ; preds = %._crit_edge133.us, %.lr.ph136.split.us.preheader
  %indvars.iv200 = phi i64 [ 0, %.lr.ph136.split.us.preheader ], [ %indvars.iv.next201, %._crit_edge133.us ]
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv200
  store double 0.000000e+00, double* %41, align 8
  br i1 %lcmp.mod198, label %.prol.loopexit196, label %.prol.preheader195.preheader

.prol.preheader195.preheader:                     ; preds = %.lr.ph136.split.us
  br label %.prol.preheader195

.prol.preheader195:                               ; preds = %.prol.preheader195.preheader, %.prol.preheader195
  %indvars.iv191.prol = phi i64 [ %indvars.iv.next192.prol, %.prol.preheader195 ], [ 0, %.prol.preheader195.preheader ]
  %prol.iter199 = phi i32 [ %prol.iter199.sub, %.prol.preheader195 ], [ %xtraiter197, %.prol.preheader195.preheader ]
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv191.prol, i64 %indvars.iv200
  %43 = load double, double* %42, align 8
  %44 = load double, double* %41, align 8
  %45 = fadd double %43, %44
  store double %45, double* %41, align 8
  %indvars.iv.next192.prol = add nuw nsw i64 %indvars.iv191.prol, 1
  %prol.iter199.sub = add i32 %prol.iter199, -1
  %prol.iter199.cmp = icmp eq i32 %prol.iter199.sub, 0
  br i1 %prol.iter199.cmp, label %.prol.loopexit196.loopexit, label %.prol.preheader195, !llvm.loop !6

.prol.loopexit196.loopexit:                       ; preds = %.prol.preheader195
  br label %.prol.loopexit196

.prol.loopexit196:                                ; preds = %.prol.loopexit196.loopexit, %.lr.ph136.split.us
  %indvars.iv191.unr = phi i64 [ 0, %.lr.ph136.split.us ], [ %indvars.iv.next192.prol, %.prol.loopexit196.loopexit ]
  br i1 %40, label %._crit_edge133.us, label %.lr.ph136.split.us.new.preheader

.lr.ph136.split.us.new.preheader:                 ; preds = %.prol.loopexit196
  br label %.lr.ph136.split.us.new

.lr.ph136.split.us.new:                           ; preds = %.lr.ph136.split.us.new.preheader, %.lr.ph136.split.us.new
  %indvars.iv191 = phi i64 [ %indvars.iv.next192.3, %.lr.ph136.split.us.new ], [ %indvars.iv191.unr, %.lr.ph136.split.us.new.preheader ]
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv191, i64 %indvars.iv200
  %47 = load double, double* %46, align 8
  %48 = load double, double* %41, align 8
  %49 = fadd double %47, %48
  store double %49, double* %41, align 8
  %indvars.iv.next192 = add nuw nsw i64 %indvars.iv191, 1
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next192, i64 %indvars.iv200
  %51 = load double, double* %50, align 8
  %52 = fadd double %51, %49
  store double %52, double* %41, align 8
  %indvars.iv.next192.1 = add nsw i64 %indvars.iv191, 2
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next192.1, i64 %indvars.iv200
  %54 = load double, double* %53, align 8
  %55 = fadd double %54, %52
  store double %55, double* %41, align 8
  %indvars.iv.next192.2 = add nsw i64 %indvars.iv191, 3
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next192.2, i64 %indvars.iv200
  %57 = load double, double* %56, align 8
  %58 = fadd double %57, %55
  store double %58, double* %41, align 8
  %indvars.iv.next192.3 = add nsw i64 %indvars.iv191, 4
  %exitcond194.3 = icmp eq i64 %indvars.iv.next192.3, %wide.trip.count193.3
  br i1 %exitcond194.3, label %._crit_edge133.us.loopexit, label %.lr.ph136.split.us.new

._crit_edge133.us.loopexit:                       ; preds = %.lr.ph136.split.us.new
  br label %._crit_edge133.us

._crit_edge133.us:                                ; preds = %._crit_edge133.us.loopexit, %.prol.loopexit196
  %59 = load double, double* %41, align 8
  %60 = fdiv double %59, %2
  store double %60, double* %41, align 8
  %indvars.iv.next201 = add nuw nsw i64 %indvars.iv200, 1
  %exitcond203 = icmp eq i64 %indvars.iv.next201, %wide.trip.count202
  br i1 %exitcond203, label %.preheader106.loopexit, label %.lr.ph136.split.us

.preheader106.loopexit:                           ; preds = %._crit_edge133.us
  br label %.preheader106

.preheader106.loopexit236:                        ; preds = %.lr.ph136.split
  br label %.preheader106

.preheader106:                                    ; preds = %.preheader106.loopexit236, %.preheader106.loopexit, %middle.block
  %61 = icmp sgt i32 %0, 0
  br i1 %61, label %.lr.ph129, label %.preheader105

.lr.ph129:                                        ; preds = %.lr.ph136.split.prol.loopexit, %.preheader106
  %62 = icmp sgt i32 %1, 0
  br i1 %62, label %.lr.ph129.split.us.preheader, label %.lr.ph129.split.preheader

.lr.ph129.split.us.preheader:                     ; preds = %.lr.ph129
  %xtraiter179 = and i32 %1, 1
  %lcmp.mod180 = icmp eq i32 %xtraiter179, 0
  %63 = icmp eq i32 %1, 1
  %wide.trip.count183 = zext i32 %0 to i64
  %wide.trip.count175.1 = zext i32 %1 to i64
  br label %.lr.ph129.split.us

.lr.ph129.split.preheader:                        ; preds = %.lr.ph129
  %xtraiter189 = and i32 %0, 1
  %lcmp.mod190 = icmp eq i32 %xtraiter189, 0
  br i1 %lcmp.mod190, label %.lr.ph129.split.prol.loopexit, label %.lr.ph129.split.prol

.lr.ph129.split.prol:                             ; preds = %.lr.ph129.split.preheader
  %64 = fdiv double 0.000000e+00, %2
  store double %64, double* %6, align 8
  %65 = tail call double @sqrt(double %64) #4
  %66 = fcmp ole double %65, 1.000000e-01
  %67 = select i1 %66, double 1.000000e+00, double %65
  store double %67, double* %6, align 8
  br label %.lr.ph129.split.prol.loopexit

.lr.ph129.split.prol.loopexit:                    ; preds = %.lr.ph129.split.preheader, %.lr.ph129.split.prol
  %indvars.iv185.unr = phi i64 [ 0, %.lr.ph129.split.preheader ], [ 1, %.lr.ph129.split.prol ]
  %68 = icmp eq i32 %0, 1
  br i1 %68, label %.preheader105, label %.lr.ph129.split.preheader214

.lr.ph129.split.preheader214:                     ; preds = %.lr.ph129.split.prol.loopexit
  %69 = fdiv double 0.000000e+00, %2
  %70 = fdiv double 0.000000e+00, %2
  %wide.trip.count187.1 = zext i32 %0 to i64
  br label %.lr.ph129.split

.lr.ph129.split.us:                               ; preds = %.lr.ph129.split.us.preheader, %._crit_edge127.us
  %indvars.iv181 = phi i64 [ %indvars.iv.next182, %._crit_edge127.us ], [ 0, %.lr.ph129.split.us.preheader ]
  %71 = getelementptr inbounds double, double* %6, i64 %indvars.iv181
  store double 0.000000e+00, double* %71, align 8
  %72 = getelementptr inbounds double, double* %5, i64 %indvars.iv181
  br i1 %lcmp.mod180, label %.prol.loopexit178, label %.prol.preheader177

.prol.preheader177:                               ; preds = %.lr.ph129.split.us
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv181
  %74 = load double, double* %73, align 8
  %75 = load double, double* %72, align 8
  %76 = fsub double %74, %75
  %77 = fmul double %76, %76
  %78 = load double, double* %71, align 8
  %79 = fadd double %78, %77
  store double %79, double* %71, align 8
  br label %.prol.loopexit178

.prol.loopexit178:                                ; preds = %.prol.preheader177, %.lr.ph129.split.us
  %indvars.iv173.unr.ph = phi i64 [ 1, %.prol.preheader177 ], [ 0, %.lr.ph129.split.us ]
  br i1 %63, label %._crit_edge127.us, label %.lr.ph129.split.us.new.preheader

.lr.ph129.split.us.new.preheader:                 ; preds = %.prol.loopexit178
  br label %.lr.ph129.split.us.new

.lr.ph129.split.us.new:                           ; preds = %.lr.ph129.split.us.new.preheader, %.lr.ph129.split.us.new
  %indvars.iv173 = phi i64 [ %indvars.iv.next174.1, %.lr.ph129.split.us.new ], [ %indvars.iv173.unr.ph, %.lr.ph129.split.us.new.preheader ]
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv173, i64 %indvars.iv181
  %81 = load double, double* %80, align 8
  %82 = load double, double* %72, align 8
  %83 = fsub double %81, %82
  %84 = fmul double %83, %83
  %85 = load double, double* %71, align 8
  %86 = fadd double %85, %84
  store double %86, double* %71, align 8
  %indvars.iv.next174 = add nuw nsw i64 %indvars.iv173, 1
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next174, i64 %indvars.iv181
  %88 = load double, double* %87, align 8
  %89 = load double, double* %72, align 8
  %90 = fsub double %88, %89
  %91 = fmul double %90, %90
  %92 = load double, double* %71, align 8
  %93 = fadd double %92, %91
  store double %93, double* %71, align 8
  %indvars.iv.next174.1 = add nsw i64 %indvars.iv173, 2
  %exitcond176.1 = icmp eq i64 %indvars.iv.next174.1, %wide.trip.count175.1
  br i1 %exitcond176.1, label %._crit_edge127.us.loopexit, label %.lr.ph129.split.us.new

._crit_edge127.us.loopexit:                       ; preds = %.lr.ph129.split.us.new
  br label %._crit_edge127.us

._crit_edge127.us:                                ; preds = %._crit_edge127.us.loopexit, %.prol.loopexit178
  %94 = load double, double* %71, align 8
  %95 = fdiv double %94, %2
  store double %95, double* %71, align 8
  %96 = tail call double @sqrt(double %95) #4
  %97 = fcmp ole double %96, 1.000000e-01
  %98 = select i1 %97, double 1.000000e+00, double %96
  store double %98, double* %71, align 8
  %indvars.iv.next182 = add nuw nsw i64 %indvars.iv181, 1
  %exitcond184 = icmp eq i64 %indvars.iv.next182, %wide.trip.count183
  br i1 %exitcond184, label %.preheader105.loopexit, label %.lr.ph129.split.us

.lr.ph136.split:                                  ; preds = %.lr.ph136.split.preheader235, %.lr.ph136.split
  %indvars.iv204 = phi i64 [ %indvars.iv.next205.3, %.lr.ph136.split ], [ %indvars.iv204.ph, %.lr.ph136.split.preheader235 ]
  %99 = getelementptr inbounds double, double* %5, i64 %indvars.iv204
  store double %14, double* %99, align 8
  %indvars.iv.next205 = add nuw nsw i64 %indvars.iv204, 1
  %100 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next205
  store double %15, double* %100, align 8
  %indvars.iv.next205.1 = add nsw i64 %indvars.iv204, 2
  %101 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next205.1
  store double %16, double* %101, align 8
  %indvars.iv.next205.2 = add nsw i64 %indvars.iv204, 3
  %102 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next205.2
  store double %17, double* %102, align 8
  %indvars.iv.next205.3 = add nsw i64 %indvars.iv204, 4
  %exitcond207.3 = icmp eq i64 %indvars.iv.next205.3, %wide.trip.count206.3
  br i1 %exitcond207.3, label %.preheader106.loopexit236, label %.lr.ph136.split, !llvm.loop !7

.preheader105.loopexit:                           ; preds = %._crit_edge127.us
  br label %.preheader105

.preheader105.loopexit234:                        ; preds = %.lr.ph129.split
  br label %.preheader105

.preheader105:                                    ; preds = %.preheader105.loopexit234, %.preheader105.loopexit, %7, %.lr.ph129.split.prol.loopexit, %.preheader106
  %103 = icmp sgt i32 %1, 0
  br i1 %103, label %.preheader104.lr.ph, label %.preheader

.preheader104.lr.ph:                              ; preds = %.preheader105
  %104 = icmp sgt i32 %0, 0
  br i1 %104, label %.preheader104.us.preheader, label %.preheader.thread

.preheader104.us.preheader:                       ; preds = %.preheader104.lr.ph
  %wide.trip.count166 = zext i32 %0 to i64
  %wide.trip.count170 = zext i32 %1 to i64
  br label %.preheader104.us

.preheader.thread:                                ; preds = %.preheader104.lr.ph
  %105 = add nsw i32 %0, -1
  br label %._crit_edge113

.preheader104.us:                                 ; preds = %.preheader104.us.preheader, %._crit_edge122.us
  %indvars.iv168 = phi i64 [ %indvars.iv.next169, %._crit_edge122.us ], [ 0, %.preheader104.us.preheader ]
  br label %106

; <label>:106:                                    ; preds = %106, %.preheader104.us
  %indvars.iv164 = phi i64 [ 0, %.preheader104.us ], [ %indvars.iv.next165, %106 ]
  %107 = getelementptr inbounds double, double* %5, i64 %indvars.iv164
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv168, i64 %indvars.iv164
  %110 = load double, double* %109, align 8
  %111 = fsub double %110, %108
  store double %111, double* %109, align 8
  %112 = tail call double @sqrt(double %2) #4
  %113 = getelementptr inbounds double, double* %6, i64 %indvars.iv164
  %114 = load double, double* %113, align 8
  %115 = fmul double %112, %114
  %116 = load double, double* %109, align 8
  %117 = fdiv double %116, %115
  store double %117, double* %109, align 8
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1
  %exitcond167 = icmp eq i64 %indvars.iv.next165, %wide.trip.count166
  br i1 %exitcond167, label %._crit_edge122.us, label %106

._crit_edge122.us:                                ; preds = %106
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %exitcond171 = icmp eq i64 %indvars.iv.next169, %wide.trip.count170
  br i1 %exitcond171, label %.preheader.loopexit, label %.preheader104.us

.lr.ph129.split:                                  ; preds = %.lr.ph129.split.preheader214, %.lr.ph129.split
  %indvars.iv185 = phi i64 [ %indvars.iv.next186.1, %.lr.ph129.split ], [ %indvars.iv185.unr, %.lr.ph129.split.preheader214 ]
  %118 = getelementptr inbounds double, double* %6, i64 %indvars.iv185
  store double %69, double* %118, align 8
  %119 = tail call double @sqrt(double %69) #4
  %120 = fcmp ole double %119, 1.000000e-01
  %121 = select i1 %120, double 1.000000e+00, double %119
  store double %121, double* %118, align 8
  %indvars.iv.next186 = add nuw nsw i64 %indvars.iv185, 1
  %122 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next186
  store double %70, double* %122, align 8
  %123 = tail call double @sqrt(double %70) #4
  %124 = fcmp ole double %123, 1.000000e-01
  %125 = select i1 %124, double 1.000000e+00, double %123
  store double %125, double* %122, align 8
  %indvars.iv.next186.1 = add nsw i64 %indvars.iv185, 2
  %exitcond188.1 = icmp eq i64 %indvars.iv.next186.1, %wide.trip.count187.1
  br i1 %exitcond188.1, label %.preheader105.loopexit234, label %.lr.ph129.split

.preheader.loopexit:                              ; preds = %._crit_edge122.us
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.preheader105
  %126 = add nsw i32 %0, -1
  %127 = icmp sgt i32 %0, 1
  br i1 %127, label %.lr.ph112, label %._crit_edge113

.lr.ph112:                                        ; preds = %.preheader
  %128 = icmp sgt i32 %1, 0
  br i1 %128, label %.lr.ph112.split.us.preheader, label %.lr.ph112.split.preheader

.lr.ph112.split.preheader:                        ; preds = %.lr.ph112
  %129 = zext i32 %126 to i64
  %130 = add i32 %0, -2
  %131 = zext i32 %130 to i64
  %132 = sext i32 %0 to i64
  %wide.trip.count155.3 = zext i32 %0 to i64
  %wide.trip.count162 = zext i32 %126 to i64
  br label %.lr.ph112.split

.lr.ph112.split.us.preheader:                     ; preds = %.lr.ph112
  %133 = sext i32 %0 to i64
  %wide.trip.count149 = zext i32 %126 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %134 = icmp eq i32 %1, 1
  %wide.trip.count145 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph112.split.us

.lr.ph112.split.us:                               ; preds = %.loopexit.us, %.lr.ph112.split.us.preheader
  %indvars.iv147 = phi i64 [ 0, %.lr.ph112.split.us.preheader ], [ %indvars.iv.next148, %.loopexit.us ]
  %indvars.iv141 = phi i64 [ 1, %.lr.ph112.split.us.preheader ], [ %indvars.iv.next142, %.loopexit.us ]
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv147, i64 %indvars.iv147
  store double 1.000000e+00, double* %135, align 8
  %indvars.iv.next148 = add nuw nsw i64 %indvars.iv147, 1
  %136 = icmp slt i64 %indvars.iv.next148, %133
  br i1 %136, label %.lr.ph.us.us.preheader, label %.loopexit.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph112.split.us
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv147
  br label %.lr.ph.us.us

.loopexit.us.loopexit:                            ; preds = %._crit_edge.us.us
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit, %.lr.ph112.split.us
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %exitcond150 = icmp eq i64 %indvars.iv.next148, %wide.trip.count149
  br i1 %exitcond150, label %._crit_edge113.loopexit, label %.lr.ph112.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv143 = phi i64 [ %indvars.iv.next144, %._crit_edge.us.us ], [ %indvars.iv141, %.lr.ph.us.us.preheader ]
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv147, i64 %indvars.iv143
  store double 0.000000e+00, double* %138, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %139 = load double, double* %137, align 8
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv143
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
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv143, i64 %indvars.iv147
  %148 = bitcast double* %147 to i64*
  store i64 %146, i64* %148, align 8
  %indvars.iv.next144 = add nuw nsw i64 %indvars.iv143, 1
  %exitcond = icmp eq i64 %indvars.iv.next144, %wide.trip.count145
  br i1 %exitcond, label %.loopexit.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv147
  %150 = load double, double* %149, align 8
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv143
  %152 = load double, double* %151, align 8
  %153 = fmul double %150, %152
  %154 = load double, double* %138, align 8
  %155 = fadd double %154, %153
  store double %155, double* %138, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv147
  %157 = load double, double* %156, align 8
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv143
  %159 = load double, double* %158, align 8
  %160 = fmul double %157, %159
  %161 = load double, double* %138, align 8
  %162 = fadd double %161, %160
  store double %162, double* %138, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.loopexit.loopexit:                               ; preds = %.lr.ph110.split
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.lr.ph110.split.prol.loopexit, %.lr.ph112.split
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %exitcond163 = icmp eq i64 %indvars.iv.next161, %wide.trip.count162
  br i1 %exitcond163, label %._crit_edge113.loopexit233, label %.lr.ph112.split

.lr.ph112.split:                                  ; preds = %.loopexit, %.lr.ph112.split.preheader
  %indvars.iv160 = phi i64 [ 0, %.lr.ph112.split.preheader ], [ %indvars.iv.next161, %.loopexit ]
  %indvars.iv151 = phi i64 [ 1, %.lr.ph112.split.preheader ], [ %indvars.iv.next152, %.loopexit ]
  %163 = sub i64 %131, %indvars.iv160
  %164 = trunc i64 %163 to i32
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv160, i64 %indvars.iv160
  store double 1.000000e+00, double* %165, align 8
  %indvars.iv.next161 = add nuw nsw i64 %indvars.iv160, 1
  %166 = icmp slt i64 %indvars.iv.next161, %132
  br i1 %166, label %.lr.ph110.split.preheader, label %.loopexit

.lr.ph110.split.preheader:                        ; preds = %.lr.ph112.split
  %167 = sub i64 %129, %indvars.iv160
  %168 = trunc i64 %167 to i32
  %xtraiter158 = and i32 %168, 3
  %lcmp.mod159 = icmp eq i32 %xtraiter158, 0
  br i1 %lcmp.mod159, label %.lr.ph110.split.prol.loopexit, label %.lr.ph110.split.prol.preheader

.lr.ph110.split.prol.preheader:                   ; preds = %.lr.ph110.split.preheader
  br label %.lr.ph110.split.prol

.lr.ph110.split.prol:                             ; preds = %.lr.ph110.split.prol.preheader, %.lr.ph110.split.prol
  %indvars.iv153.prol = phi i64 [ %indvars.iv.next154.prol, %.lr.ph110.split.prol ], [ %indvars.iv151, %.lr.ph110.split.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph110.split.prol ], [ %xtraiter158, %.lr.ph110.split.prol.preheader ]
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv160, i64 %indvars.iv153.prol
  store double 0.000000e+00, double* %169, align 8
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv153.prol, i64 %indvars.iv160
  %171 = bitcast double* %170 to i64*
  store i64 0, i64* %171, align 8
  %indvars.iv.next154.prol = add nuw nsw i64 %indvars.iv153.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph110.split.prol.loopexit.loopexit, label %.lr.ph110.split.prol, !llvm.loop !9

.lr.ph110.split.prol.loopexit.loopexit:           ; preds = %.lr.ph110.split.prol
  br label %.lr.ph110.split.prol.loopexit

.lr.ph110.split.prol.loopexit:                    ; preds = %.lr.ph110.split.prol.loopexit.loopexit, %.lr.ph110.split.preheader
  %indvars.iv153.unr = phi i64 [ %indvars.iv151, %.lr.ph110.split.preheader ], [ %indvars.iv.next154.prol, %.lr.ph110.split.prol.loopexit.loopexit ]
  %172 = icmp ult i32 %164, 3
  br i1 %172, label %.loopexit, label %.lr.ph110.split.preheader232

.lr.ph110.split.preheader232:                     ; preds = %.lr.ph110.split.prol.loopexit
  br label %.lr.ph110.split

.lr.ph110.split:                                  ; preds = %.lr.ph110.split.preheader232, %.lr.ph110.split
  %indvars.iv153 = phi i64 [ %indvars.iv.next154.3, %.lr.ph110.split ], [ %indvars.iv153.unr, %.lr.ph110.split.preheader232 ]
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv160, i64 %indvars.iv153
  store double 0.000000e+00, double* %173, align 8
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv153, i64 %indvars.iv160
  %175 = bitcast double* %174 to i64*
  store i64 0, i64* %175, align 8
  %indvars.iv.next154 = add nuw nsw i64 %indvars.iv153, 1
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv160, i64 %indvars.iv.next154
  store double 0.000000e+00, double* %176, align 8
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next154, i64 %indvars.iv160
  %178 = bitcast double* %177 to i64*
  store i64 0, i64* %178, align 8
  %indvars.iv.next154.1 = add nsw i64 %indvars.iv153, 2
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv160, i64 %indvars.iv.next154.1
  store double 0.000000e+00, double* %179, align 8
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next154.1, i64 %indvars.iv160
  %181 = bitcast double* %180 to i64*
  store i64 0, i64* %181, align 8
  %indvars.iv.next154.2 = add nsw i64 %indvars.iv153, 3
  %182 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv160, i64 %indvars.iv.next154.2
  store double 0.000000e+00, double* %182, align 8
  %183 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next154.2, i64 %indvars.iv160
  %184 = bitcast double* %183 to i64*
  store i64 0, i64* %184, align 8
  %indvars.iv.next154.3 = add nsw i64 %indvars.iv153, 4
  %exitcond156.3 = icmp eq i64 %indvars.iv.next154.3, %wide.trip.count155.3
  br i1 %exitcond156.3, label %.loopexit.loopexit, label %.lr.ph110.split

._crit_edge113.loopexit:                          ; preds = %.loopexit.us
  br label %._crit_edge113

._crit_edge113.loopexit233:                       ; preds = %.loopexit
  br label %._crit_edge113

._crit_edge113:                                   ; preds = %._crit_edge113.loopexit233, %._crit_edge113.loopexit, %.preheader.thread, %.preheader
  %185 = phi i32 [ %105, %.preheader.thread ], [ %126, %.preheader ], [ %126, %._crit_edge113.loopexit ], [ %126, %._crit_edge113.loopexit233 ]
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %186, i64 %186
  store double 1.000000e+00, double* %187, align 8
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge13

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count16 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv14, %8
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
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count16
  br i1 %exitcond17, label %._crit_edge13.loopexit, label %.preheader.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %2
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
