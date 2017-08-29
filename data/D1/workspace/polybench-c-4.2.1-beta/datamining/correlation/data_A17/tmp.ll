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

._crit_edge:                                      ; preds = %20, %4
  %indvars.iv8 = phi i64 [ 0, %4 ], [ %indvars.iv.next9, %20 ]
  %5 = trunc i64 %indvars.iv8 to i32
  %6 = sitofp i32 %5 to double
  br label %7

; <label>:7:                                      ; preds = %7, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv, %indvars.iv8
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.200000e+03
  %12 = fadd double %6, %11
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv8, i64 %indvars.iv
  store double %12, double* %13, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv8
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.200000e+03
  %18 = fadd double %6, %17
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv8, i64 %indvars.iv.next
  store double %18, double* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, 1400
  br i1 %exitcond, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph126, label %._crit_edge89

.lr.ph126:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph126.split.us.preheader, label %.lr.ph126.split.preheader

.lr.ph126.split.preheader:                        ; preds = %.lr.ph126
  %10 = add i32 %0, -1
  %xtraiter198 = and i32 %0, 3
  %lcmp.mod199 = icmp eq i32 %xtraiter198, 0
  br i1 %lcmp.mod199, label %.lr.ph126.split.prol.loopexit, label %.lr.ph126.split.prol.preheader

.lr.ph126.split.prol.preheader:                   ; preds = %.lr.ph126.split.preheader
  %11 = fdiv double 0.000000e+00, %2
  br label %.lr.ph126.split.prol

.lr.ph126.split.prol:                             ; preds = %.lr.ph126.split.prol.preheader, %.lr.ph126.split.prol
  %indvars.iv194.prol = phi i64 [ %indvars.iv.next195.prol, %.lr.ph126.split.prol ], [ 0, %.lr.ph126.split.prol.preheader ]
  %prol.iter200 = phi i32 [ %prol.iter200.sub, %.lr.ph126.split.prol ], [ %xtraiter198, %.lr.ph126.split.prol.preheader ]
  %12 = getelementptr inbounds double, double* %5, i64 %indvars.iv194.prol
  store double %11, double* %12, align 8
  %indvars.iv.next195.prol = add nuw nsw i64 %indvars.iv194.prol, 1
  %prol.iter200.sub = add i32 %prol.iter200, -1
  %prol.iter200.cmp = icmp eq i32 %prol.iter200.sub, 0
  br i1 %prol.iter200.cmp, label %.lr.ph126.split.prol.loopexit.loopexit, label %.lr.ph126.split.prol, !llvm.loop !1

.lr.ph126.split.prol.loopexit.loopexit:           ; preds = %.lr.ph126.split.prol
  br label %.lr.ph126.split.prol.loopexit

.lr.ph126.split.prol.loopexit:                    ; preds = %.lr.ph126.split.prol.loopexit.loopexit, %.lr.ph126.split.preheader
  %indvars.iv194.unr = phi i64 [ 0, %.lr.ph126.split.preheader ], [ %indvars.iv.next195.prol, %.lr.ph126.split.prol.loopexit.loopexit ]
  %13 = icmp ult i32 %10, 3
  br i1 %13, label %.lr.ph119, label %.lr.ph126.split.preheader206

.lr.ph126.split.preheader206:                     ; preds = %.lr.ph126.split.prol.loopexit
  %14 = fdiv double 0.000000e+00, %2
  %wide.trip.count196.3 = zext i32 %0 to i64
  %15 = add nsw i64 %wide.trip.count196.3, -4
  %16 = sub i64 %15, %indvars.iv194.unr
  %17 = lshr i64 %16, 2
  %18 = add nuw nsw i64 %17, 1
  %min.iters.check = icmp ult i64 %18, 4
  br i1 %min.iters.check, label %.lr.ph126.split.preheader225, label %min.iters.checked

.lr.ph126.split.preheader225:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph126.split.preheader206
  %indvars.iv194.ph = phi i64 [ %indvars.iv194.unr, %min.iters.checked ], [ %indvars.iv194.unr, %.lr.ph126.split.preheader206 ], [ %ind.end, %middle.block ]
  br label %.lr.ph126.split

min.iters.checked:                                ; preds = %.lr.ph126.split.preheader206
  %n.mod.vf = and i64 %18, 3
  %n.vec = sub nsw i64 %18, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %19 = shl nuw i64 %17, 2
  %20 = add i64 %indvars.iv194.unr, %19
  %21 = add i64 %20, 4
  %22 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %21, %22
  br i1 %cmp.zero, label %.lr.ph126.split.preheader225, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert213 = insertelement <2 x double> undef, double %14, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert213, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %23 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv194.unr, %23
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
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph126.split.preheader225

.lr.ph126.split.us.preheader:                     ; preds = %.lr.ph126
  %33 = add i32 %1, -1
  %xtraiter187 = and i32 %1, 3
  %lcmp.mod188 = icmp eq i32 %xtraiter187, 0
  %34 = icmp ult i32 %33, 3
  %wide.trip.count192 = zext i32 %0 to i64
  %wide.trip.count183.3 = zext i32 %1 to i64
  br label %.lr.ph126.split.us

.lr.ph126.split.us:                               ; preds = %._crit_edge123.us, %.lr.ph126.split.us.preheader
  %indvars.iv190 = phi i64 [ 0, %.lr.ph126.split.us.preheader ], [ %indvars.iv.next191, %._crit_edge123.us ]
  %35 = getelementptr inbounds double, double* %5, i64 %indvars.iv190
  store double 0.000000e+00, double* %35, align 8
  br i1 %lcmp.mod188, label %.prol.loopexit186, label %.prol.preheader185.preheader

.prol.preheader185.preheader:                     ; preds = %.lr.ph126.split.us
  br label %.prol.preheader185

.prol.preheader185:                               ; preds = %.prol.preheader185.preheader, %.prol.preheader185
  %36 = phi double [ %39, %.prol.preheader185 ], [ 0.000000e+00, %.prol.preheader185.preheader ]
  %indvars.iv181.prol = phi i64 [ %indvars.iv.next182.prol, %.prol.preheader185 ], [ 0, %.prol.preheader185.preheader ]
  %prol.iter189 = phi i32 [ %prol.iter189.sub, %.prol.preheader185 ], [ %xtraiter187, %.prol.preheader185.preheader ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv181.prol, i64 %indvars.iv190
  %38 = load double, double* %37, align 8
  %39 = fadd double %38, %36
  store double %39, double* %35, align 8
  %indvars.iv.next182.prol = add nuw nsw i64 %indvars.iv181.prol, 1
  %prol.iter189.sub = add i32 %prol.iter189, -1
  %prol.iter189.cmp = icmp eq i32 %prol.iter189.sub, 0
  br i1 %prol.iter189.cmp, label %.prol.loopexit186.loopexit, label %.prol.preheader185, !llvm.loop !6

.prol.loopexit186.loopexit:                       ; preds = %.prol.preheader185
  br label %.prol.loopexit186

.prol.loopexit186:                                ; preds = %.prol.loopexit186.loopexit, %.lr.ph126.split.us
  %40 = phi double [ 0.000000e+00, %.lr.ph126.split.us ], [ %39, %.prol.loopexit186.loopexit ]
  %indvars.iv181.unr = phi i64 [ 0, %.lr.ph126.split.us ], [ %indvars.iv.next182.prol, %.prol.loopexit186.loopexit ]
  br i1 %34, label %._crit_edge123.us, label %.lr.ph126.split.us.new.preheader

.lr.ph126.split.us.new.preheader:                 ; preds = %.prol.loopexit186
  br label %.lr.ph126.split.us.new

.lr.ph126.split.us.new:                           ; preds = %.lr.ph126.split.us.new.preheader, %.lr.ph126.split.us.new
  %41 = phi double [ %53, %.lr.ph126.split.us.new ], [ %40, %.lr.ph126.split.us.new.preheader ]
  %indvars.iv181 = phi i64 [ %indvars.iv.next182.3, %.lr.ph126.split.us.new ], [ %indvars.iv181.unr, %.lr.ph126.split.us.new.preheader ]
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv181, i64 %indvars.iv190
  %43 = load double, double* %42, align 8
  %44 = fadd double %43, %41
  store double %44, double* %35, align 8
  %indvars.iv.next182 = add nuw nsw i64 %indvars.iv181, 1
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next182, i64 %indvars.iv190
  %46 = load double, double* %45, align 8
  %47 = fadd double %46, %44
  store double %47, double* %35, align 8
  %indvars.iv.next182.1 = add nsw i64 %indvars.iv181, 2
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next182.1, i64 %indvars.iv190
  %49 = load double, double* %48, align 8
  %50 = fadd double %49, %47
  store double %50, double* %35, align 8
  %indvars.iv.next182.2 = add nsw i64 %indvars.iv181, 3
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next182.2, i64 %indvars.iv190
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  store double %53, double* %35, align 8
  %indvars.iv.next182.3 = add nsw i64 %indvars.iv181, 4
  %exitcond184.3 = icmp eq i64 %indvars.iv.next182.3, %wide.trip.count183.3
  br i1 %exitcond184.3, label %._crit_edge123.us.loopexit, label %.lr.ph126.split.us.new

._crit_edge123.us.loopexit:                       ; preds = %.lr.ph126.split.us.new
  br label %._crit_edge123.us

._crit_edge123.us:                                ; preds = %._crit_edge123.us.loopexit, %.prol.loopexit186
  %54 = phi double [ %40, %.prol.loopexit186 ], [ %53, %._crit_edge123.us.loopexit ]
  %55 = fdiv double %54, %2
  store double %55, double* %35, align 8
  %indvars.iv.next191 = add nuw nsw i64 %indvars.iv190, 1
  %exitcond193 = icmp eq i64 %indvars.iv.next191, %wide.trip.count192
  br i1 %exitcond193, label %._crit_edge.loopexit, label %.lr.ph126.split.us

._crit_edge.loopexit:                             ; preds = %._crit_edge123.us
  br label %._crit_edge

._crit_edge.loopexit226:                          ; preds = %.lr.ph126.split
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit226, %._crit_edge.loopexit, %middle.block
  br i1 true, label %.lr.ph119, label %._crit_edge.._crit_edge89_crit_edge

._crit_edge.._crit_edge89_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge89

.lr.ph119:                                        ; preds = %.lr.ph126.split.prol.loopexit, %._crit_edge
  br i1 %9, label %.lr.ph119.split.us.preheader, label %.lr.ph119.split.preheader

.lr.ph119.split.us.preheader:                     ; preds = %.lr.ph119
  %xtraiter169 = and i32 %1, 1
  %lcmp.mod170 = icmp eq i32 %xtraiter169, 0
  %56 = icmp eq i32 %1, 1
  %wide.trip.count173 = zext i32 %0 to i64
  %wide.trip.count165.1 = zext i32 %1 to i64
  br label %.lr.ph119.split.us

.lr.ph119.split.preheader:                        ; preds = %.lr.ph119
  %xtraiter179 = and i32 %0, 1
  %lcmp.mod180 = icmp eq i32 %xtraiter179, 0
  br i1 %lcmp.mod180, label %.lr.ph119.split.prol.loopexit, label %.lr.ph119.split.prol

.lr.ph119.split.prol:                             ; preds = %.lr.ph119.split.preheader
  %57 = fdiv double 0.000000e+00, %2
  store double %57, double* %6, align 8
  %58 = tail call double @sqrt(double %57) #4
  %59 = fcmp ugt double %58, 1.000000e-01
  %60 = select i1 %59, double %58, double 1.000000e+00
  store double %60, double* %6, align 8
  br label %.lr.ph119.split.prol.loopexit

.lr.ph119.split.prol.loopexit:                    ; preds = %.lr.ph119.split.preheader, %.lr.ph119.split.prol
  %indvars.iv175.unr = phi i64 [ 0, %.lr.ph119.split.preheader ], [ 1, %.lr.ph119.split.prol ]
  %61 = icmp eq i32 %0, 1
  br i1 %61, label %._crit_edge89, label %.lr.ph119.split.preheader204

.lr.ph119.split.preheader204:                     ; preds = %.lr.ph119.split.prol.loopexit
  %62 = fdiv double 0.000000e+00, %2
  %wide.trip.count177.1 = zext i32 %0 to i64
  br label %.lr.ph119.split

.lr.ph119.split.us:                               ; preds = %.lr.ph119.split.us.preheader, %._crit_edge117.us
  %indvars.iv171 = phi i64 [ %indvars.iv.next172, %._crit_edge117.us ], [ 0, %.lr.ph119.split.us.preheader ]
  %63 = getelementptr inbounds double, double* %6, i64 %indvars.iv171
  store double 0.000000e+00, double* %63, align 8
  %64 = getelementptr inbounds double, double* %5, i64 %indvars.iv171
  br i1 %lcmp.mod170, label %.prol.loopexit168, label %.prol.preheader167

.prol.preheader167:                               ; preds = %.lr.ph119.split.us
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv171
  %66 = load double, double* %65, align 8
  %67 = load double, double* %64, align 8
  %68 = fsub double %66, %67
  %69 = fmul double %68, %68
  %70 = fadd double %69, 0.000000e+00
  store double %70, double* %63, align 8
  br label %.prol.loopexit168

.prol.loopexit168:                                ; preds = %.prol.preheader167, %.lr.ph119.split.us
  %71 = phi double [ %70, %.prol.preheader167 ], [ 0.000000e+00, %.lr.ph119.split.us ]
  %indvars.iv163.unr.ph = phi i64 [ 1, %.prol.preheader167 ], [ 0, %.lr.ph119.split.us ]
  br i1 %56, label %._crit_edge117.us, label %.lr.ph119.split.us.new.preheader

.lr.ph119.split.us.new.preheader:                 ; preds = %.prol.loopexit168
  br label %.lr.ph119.split.us.new

.lr.ph119.split.us.new:                           ; preds = %.lr.ph119.split.us.new.preheader, %.lr.ph119.split.us.new
  %72 = phi double [ %84, %.lr.ph119.split.us.new ], [ %71, %.lr.ph119.split.us.new.preheader ]
  %indvars.iv163 = phi i64 [ %indvars.iv.next164.1, %.lr.ph119.split.us.new ], [ %indvars.iv163.unr.ph, %.lr.ph119.split.us.new.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv163, i64 %indvars.iv171
  %74 = load double, double* %73, align 8
  %75 = load double, double* %64, align 8
  %76 = fsub double %74, %75
  %77 = fmul double %76, %76
  %78 = fadd double %72, %77
  store double %78, double* %63, align 8
  %indvars.iv.next164 = add nuw nsw i64 %indvars.iv163, 1
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next164, i64 %indvars.iv171
  %80 = load double, double* %79, align 8
  %81 = load double, double* %64, align 8
  %82 = fsub double %80, %81
  %83 = fmul double %82, %82
  %84 = fadd double %78, %83
  store double %84, double* %63, align 8
  %indvars.iv.next164.1 = add nsw i64 %indvars.iv163, 2
  %exitcond166.1 = icmp eq i64 %indvars.iv.next164.1, %wide.trip.count165.1
  br i1 %exitcond166.1, label %._crit_edge117.us.loopexit, label %.lr.ph119.split.us.new

._crit_edge117.us.loopexit:                       ; preds = %.lr.ph119.split.us.new
  br label %._crit_edge117.us

._crit_edge117.us:                                ; preds = %._crit_edge117.us.loopexit, %.prol.loopexit168
  %85 = phi double [ %71, %.prol.loopexit168 ], [ %84, %._crit_edge117.us.loopexit ]
  %86 = fdiv double %85, %2
  store double %86, double* %63, align 8
  %87 = tail call double @sqrt(double %86) #4
  %88 = fcmp ugt double %87, 1.000000e-01
  %89 = select i1 %88, double %87, double 1.000000e+00
  store double %89, double* %63, align 8
  %indvars.iv.next172 = add nuw nsw i64 %indvars.iv171, 1
  %exitcond174 = icmp eq i64 %indvars.iv.next172, %wide.trip.count173
  br i1 %exitcond174, label %._crit_edge89.loopexit, label %.lr.ph119.split.us

.lr.ph126.split:                                  ; preds = %.lr.ph126.split.preheader225, %.lr.ph126.split
  %indvars.iv194 = phi i64 [ %indvars.iv.next195.3, %.lr.ph126.split ], [ %indvars.iv194.ph, %.lr.ph126.split.preheader225 ]
  %90 = getelementptr inbounds double, double* %5, i64 %indvars.iv194
  store double %14, double* %90, align 8
  %indvars.iv.next195 = add nuw nsw i64 %indvars.iv194, 1
  %91 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next195
  store double %14, double* %91, align 8
  %indvars.iv.next195.1 = add nsw i64 %indvars.iv194, 2
  %92 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next195.1
  store double %14, double* %92, align 8
  %indvars.iv.next195.2 = add nsw i64 %indvars.iv194, 3
  %93 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next195.2
  store double %14, double* %93, align 8
  %indvars.iv.next195.3 = add nsw i64 %indvars.iv194, 4
  %exitcond197.3 = icmp eq i64 %indvars.iv.next195.3, %wide.trip.count196.3
  br i1 %exitcond197.3, label %._crit_edge.loopexit226, label %.lr.ph126.split, !llvm.loop !7

._crit_edge89.loopexit:                           ; preds = %._crit_edge117.us
  br label %._crit_edge89

._crit_edge89.loopexit224:                        ; preds = %.lr.ph119.split
  br label %._crit_edge89

._crit_edge89:                                    ; preds = %._crit_edge89.loopexit224, %._crit_edge89.loopexit, %._crit_edge.._crit_edge89_crit_edge, %7, %.lr.ph119.split.prol.loopexit
  %94 = icmp sgt i32 %1, 0
  br i1 %94, label %._crit_edge90.lr.ph, label %._crit_edge91

._crit_edge90.lr.ph:                              ; preds = %._crit_edge89
  br i1 %8, label %._crit_edge90.us.preheader, label %._crit_edge91.thread

._crit_edge90.us.preheader:                       ; preds = %._crit_edge90.lr.ph
  %wide.trip.count156 = zext i32 %0 to i64
  %wide.trip.count160 = zext i32 %1 to i64
  br label %._crit_edge90.us

._crit_edge91.thread:                             ; preds = %._crit_edge90.lr.ph
  %95 = add nsw i32 %0, -1
  br label %._crit_edge102

._crit_edge90.us:                                 ; preds = %._crit_edge90.us.preheader, %._crit_edge112.us
  %indvars.iv158 = phi i64 [ %indvars.iv.next159, %._crit_edge112.us ], [ 0, %._crit_edge90.us.preheader ]
  br label %96

; <label>:96:                                     ; preds = %96, %._crit_edge90.us
  %indvars.iv154 = phi i64 [ 0, %._crit_edge90.us ], [ %indvars.iv.next155, %96 ]
  %97 = getelementptr inbounds double, double* %5, i64 %indvars.iv154
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv158, i64 %indvars.iv154
  %100 = load double, double* %99, align 8
  %101 = fsub double %100, %98
  store double %101, double* %99, align 8
  %102 = tail call double @sqrt(double %2) #4
  %103 = getelementptr inbounds double, double* %6, i64 %indvars.iv154
  %104 = load double, double* %103, align 8
  %105 = fmul double %102, %104
  %106 = load double, double* %99, align 8
  %107 = fdiv double %106, %105
  store double %107, double* %99, align 8
  %indvars.iv.next155 = add nuw nsw i64 %indvars.iv154, 1
  %exitcond157 = icmp eq i64 %indvars.iv.next155, %wide.trip.count156
  br i1 %exitcond157, label %._crit_edge112.us, label %96

._crit_edge112.us:                                ; preds = %96
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1
  %exitcond161 = icmp eq i64 %indvars.iv.next159, %wide.trip.count160
  br i1 %exitcond161, label %._crit_edge91.loopexit, label %._crit_edge90.us

.lr.ph119.split:                                  ; preds = %.lr.ph119.split.preheader204, %.lr.ph119.split
  %indvars.iv175 = phi i64 [ %indvars.iv.next176.1, %.lr.ph119.split ], [ %indvars.iv175.unr, %.lr.ph119.split.preheader204 ]
  %108 = getelementptr inbounds double, double* %6, i64 %indvars.iv175
  store double %62, double* %108, align 8
  %109 = tail call double @sqrt(double %62) #4
  %110 = fcmp ugt double %109, 1.000000e-01
  %111 = select i1 %110, double %109, double 1.000000e+00
  store double %111, double* %108, align 8
  %indvars.iv.next176 = add nuw nsw i64 %indvars.iv175, 1
  %112 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next176
  store double %62, double* %112, align 8
  %113 = tail call double @sqrt(double %62) #4
  %114 = fcmp ugt double %113, 1.000000e-01
  %115 = select i1 %114, double %113, double 1.000000e+00
  store double %115, double* %112, align 8
  %indvars.iv.next176.1 = add nsw i64 %indvars.iv175, 2
  %exitcond178.1 = icmp eq i64 %indvars.iv.next176.1, %wide.trip.count177.1
  br i1 %exitcond178.1, label %._crit_edge89.loopexit224, label %.lr.ph119.split

._crit_edge91.loopexit:                           ; preds = %._crit_edge112.us
  br label %._crit_edge91

._crit_edge91:                                    ; preds = %._crit_edge91.loopexit, %._crit_edge89
  %116 = add nsw i32 %0, -1
  %117 = icmp sgt i32 %0, 1
  br i1 %117, label %.lr.ph101, label %._crit_edge102

.lr.ph101:                                        ; preds = %._crit_edge91
  br i1 %94, label %.lr.ph101.split.us.preheader, label %.lr.ph101.split.preheader

.lr.ph101.split.preheader:                        ; preds = %.lr.ph101
  %118 = zext i32 %116 to i64
  %119 = add i32 %0, -2
  %120 = zext i32 %119 to i64
  %121 = sext i32 %0 to i64
  %wide.trip.count145.3 = zext i32 %0 to i64
  br label %.lr.ph101.split

.lr.ph101.split.us.preheader:                     ; preds = %.lr.ph101
  %122 = sext i32 %0 to i64
  %wide.trip.count139 = zext i32 %116 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %123 = icmp eq i32 %1, 1
  %wide.trip.count135 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph101.split.us

.lr.ph101.split.us:                               ; preds = %._crit_edge99.us-lcssa.us.us, %.lr.ph101.split.us.preheader
  %indvars.iv137 = phi i64 [ 0, %.lr.ph101.split.us.preheader ], [ %indvars.iv.next138, %._crit_edge99.us-lcssa.us.us ]
  %indvars.iv131 = phi i64 [ 1, %.lr.ph101.split.us.preheader ], [ %indvars.iv.next132, %._crit_edge99.us-lcssa.us.us ]
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %124, align 8
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %125 = icmp slt i64 %indvars.iv.next138, %122
  br i1 %125, label %.lr.ph.us.us.preheader, label %._crit_edge99.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph101.split.us
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv137
  br label %.lr.ph.us.us

._crit_edge99.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge94.us.us
  br label %._crit_edge99.us-lcssa.us.us

._crit_edge99.us-lcssa.us.us:                     ; preds = %._crit_edge99.us-lcssa.us.us.loopexit, %.lr.ph101.split.us
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %exitcond140 = icmp eq i64 %indvars.iv.next138, %wide.trip.count139
  br i1 %exitcond140, label %._crit_edge102.loopexit, label %.lr.ph101.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge94.us.us
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %._crit_edge94.us.us ], [ %indvars.iv131, %.lr.ph.us.us.preheader ]
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv137, i64 %indvars.iv133
  store double 0.000000e+00, double* %127, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %128 = load double, double* %126, align 8
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv133
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
  br i1 %123, label %._crit_edge94.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge94.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  %136 = bitcast double %152 to i64
  br label %._crit_edge94.us.us

._crit_edge94.us.us:                              ; preds = %._crit_edge94.us.us.loopexit, %.prol.loopexit
  %137 = phi i64 [ %134, %.prol.loopexit ], [ %136, %._crit_edge94.us.us.loopexit ]
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv133, i64 %indvars.iv137
  %139 = bitcast double* %138 to i64*
  store i64 %137, i64* %139, align 8
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %exitcond = icmp eq i64 %indvars.iv.next134, %wide.trip.count135
  br i1 %exitcond, label %._crit_edge99.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %140 = phi double [ %152, %.lr.ph.us.us.new ], [ %135, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv137
  %142 = load double, double* %141, align 8
  %143 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv133
  %144 = load double, double* %143, align 8
  %145 = fmul double %142, %144
  %146 = fadd double %140, %145
  store double %146, double* %127, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv137
  %148 = load double, double* %147, align 8
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv133
  %150 = load double, double* %149, align 8
  %151 = fmul double %148, %150
  %152 = fadd double %146, %151
  store double %152, double* %127, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge94.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph101.split:                                  ; preds = %._crit_edge99, %.lr.ph101.split.preheader
  %indvars.iv150 = phi i64 [ 0, %.lr.ph101.split.preheader ], [ %indvars.iv.next151, %._crit_edge99 ]
  %indvars.iv141 = phi i64 [ 1, %.lr.ph101.split.preheader ], [ %indvars.iv.next142, %._crit_edge99 ]
  %153 = sub i64 %120, %indvars.iv150
  %154 = trunc i64 %153 to i32
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv150, i64 %indvars.iv150
  store double 1.000000e+00, double* %155, align 8
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %156 = icmp slt i64 %indvars.iv.next151, %121
  br i1 %156, label %.lr.ph98.split.preheader, label %._crit_edge99

.lr.ph98.split.preheader:                         ; preds = %.lr.ph101.split
  %157 = sub i64 %118, %indvars.iv150
  %158 = trunc i64 %157 to i32
  %xtraiter148 = and i32 %158, 3
  %lcmp.mod149 = icmp eq i32 %xtraiter148, 0
  br i1 %lcmp.mod149, label %.lr.ph98.split.prol.loopexit, label %.lr.ph98.split.prol.preheader

.lr.ph98.split.prol.preheader:                    ; preds = %.lr.ph98.split.preheader
  br label %.lr.ph98.split.prol

.lr.ph98.split.prol:                              ; preds = %.lr.ph98.split.prol.preheader, %.lr.ph98.split.prol
  %indvars.iv143.prol = phi i64 [ %indvars.iv.next144.prol, %.lr.ph98.split.prol ], [ %indvars.iv141, %.lr.ph98.split.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph98.split.prol ], [ %xtraiter148, %.lr.ph98.split.prol.preheader ]
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv150, i64 %indvars.iv143.prol
  store double 0.000000e+00, double* %159, align 8
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv143.prol, i64 %indvars.iv150
  %161 = bitcast double* %160 to i64*
  store i64 0, i64* %161, align 8
  %indvars.iv.next144.prol = add nuw nsw i64 %indvars.iv143.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph98.split.prol.loopexit.loopexit, label %.lr.ph98.split.prol, !llvm.loop !9

.lr.ph98.split.prol.loopexit.loopexit:            ; preds = %.lr.ph98.split.prol
  br label %.lr.ph98.split.prol.loopexit

.lr.ph98.split.prol.loopexit:                     ; preds = %.lr.ph98.split.prol.loopexit.loopexit, %.lr.ph98.split.preheader
  %indvars.iv143.unr = phi i64 [ %indvars.iv141, %.lr.ph98.split.preheader ], [ %indvars.iv.next144.prol, %.lr.ph98.split.prol.loopexit.loopexit ]
  %162 = icmp ult i32 %154, 3
  br i1 %162, label %._crit_edge99, label %.lr.ph98.split.preheader222

.lr.ph98.split.preheader222:                      ; preds = %.lr.ph98.split.prol.loopexit
  br label %.lr.ph98.split

.lr.ph98.split:                                   ; preds = %.lr.ph98.split.preheader222, %.lr.ph98.split
  %indvars.iv143 = phi i64 [ %indvars.iv.next144.3, %.lr.ph98.split ], [ %indvars.iv143.unr, %.lr.ph98.split.preheader222 ]
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv150, i64 %indvars.iv143
  store double 0.000000e+00, double* %163, align 8
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv143, i64 %indvars.iv150
  %165 = bitcast double* %164 to i64*
  store i64 0, i64* %165, align 8
  %indvars.iv.next144 = add nuw nsw i64 %indvars.iv143, 1
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv150, i64 %indvars.iv.next144
  store double 0.000000e+00, double* %166, align 8
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next144, i64 %indvars.iv150
  %168 = bitcast double* %167 to i64*
  store i64 0, i64* %168, align 8
  %indvars.iv.next144.1 = add nsw i64 %indvars.iv143, 2
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv150, i64 %indvars.iv.next144.1
  store double 0.000000e+00, double* %169, align 8
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next144.1, i64 %indvars.iv150
  %171 = bitcast double* %170 to i64*
  store i64 0, i64* %171, align 8
  %indvars.iv.next144.2 = add nsw i64 %indvars.iv143, 3
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv150, i64 %indvars.iv.next144.2
  store double 0.000000e+00, double* %172, align 8
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next144.2, i64 %indvars.iv150
  %174 = bitcast double* %173 to i64*
  store i64 0, i64* %174, align 8
  %indvars.iv.next144.3 = add nsw i64 %indvars.iv143, 4
  %exitcond146.3 = icmp eq i64 %indvars.iv.next144.3, %wide.trip.count145.3
  br i1 %exitcond146.3, label %._crit_edge99.loopexit, label %.lr.ph98.split

._crit_edge99.loopexit:                           ; preds = %.lr.ph98.split
  br label %._crit_edge99

._crit_edge99:                                    ; preds = %._crit_edge99.loopexit, %.lr.ph98.split.prol.loopexit, %.lr.ph101.split
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %exitcond153 = icmp eq i64 %indvars.iv.next151, %118
  br i1 %exitcond153, label %._crit_edge102.loopexit223, label %.lr.ph101.split

._crit_edge102.loopexit:                          ; preds = %._crit_edge99.us-lcssa.us.us
  br label %._crit_edge102

._crit_edge102.loopexit223:                       ; preds = %._crit_edge99
  br label %._crit_edge102

._crit_edge102:                                   ; preds = %._crit_edge102.loopexit223, %._crit_edge102.loopexit, %._crit_edge91.thread, %._crit_edge91
  %175 = phi i32 [ %95, %._crit_edge91.thread ], [ %116, %._crit_edge91 ], [ %116, %._crit_edge102.loopexit ], [ %116, %._crit_edge102.loopexit223 ]
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
