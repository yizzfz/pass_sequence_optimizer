; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %17

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %16)
  br label %17

; <label>:17:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader.lr.ph, label %._crit_edge16

.preheader.lr.ph:                                 ; preds = %2
  %4 = sitofp i32 %0 to double
  %5 = zext i32 %0 to i64
  %6 = zext i32 %0 to i64
  %xtraiter = and i64 %6, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %7 = icmp eq i32 %0, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %8 = add i64 %indvars.iv17, %5
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, %4
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv17, i64 0
  store double %11, double* %12, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %7, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  %13 = trunc i64 %8 to i32
  %14 = trunc i64 %8 to i32
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %15 = trunc i64 %indvars.iv to i32
  %16 = sub i32 %13, %15
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %4
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv17, i64 %indvars.iv
  store double %18, double* %19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %20 = trunc i64 %indvars.iv.next to i32
  %21 = sub i32 %14, %20
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, %4
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv17, i64 %indvars.iv.next
  store double %23, double* %24, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond21.1 = icmp eq i64 %indvars.iv.next.1, %6
  br i1 %exitcond21.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond = icmp eq i64 %indvars.iv.next18, %6
  br i1 %exitcond, label %._crit_edge16.loopexit, label %.preheader.us

._crit_edge16.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  %7 = sitofp i32 %1 to double
  %8 = fdiv double 1.000000e+00, %7
  %9 = sitofp i32 %0 to double
  %10 = fdiv double 1.000000e+00, %9
  %11 = fmul double %10, 2.000000e+00
  %12 = fmul double %8, %8
  %13 = fdiv double %11, %12
  %14 = fdiv double %10, %12
  %15 = fmul double %13, -5.000000e-01
  %16 = fadd double %13, 1.000000e+00
  %17 = fmul double %14, -5.000000e-01
  %18 = fadd double %14, 1.000000e+00
  %19 = icmp slt i32 %0, 1
  br i1 %19, label %._crit_edge174, label %.preheader152.lr.ph

.preheader152.lr.ph:                              ; preds = %6
  %20 = add nsw i32 %1, -1
  %21 = icmp sgt i32 %20, 1
  %22 = fsub double -0.000000e+00, %15
  %23 = fmul double %17, 2.000000e+00
  %24 = fadd double %23, 1.000000e+00
  %25 = sext i32 %20 to i64
  %26 = icmp sgt i32 %1, 2
  %27 = add nsw i32 %1, -2
  %28 = icmp sgt i32 %20, 1
  %29 = fsub double -0.000000e+00, %17
  %30 = fmul double %15, 2.000000e+00
  %31 = fadd double %30, 1.000000e+00
  %32 = sext i32 %20 to i64
  %33 = icmp sgt i32 %1, 2
  %34 = sext i32 %27 to i64
  %35 = zext i32 %20 to i64
  br label %.preheader152

.preheader152:                                    ; preds = %._crit_edge172, %.preheader152.lr.ph
  %.0173 = phi i32 [ 1, %.preheader152.lr.ph ], [ %167, %._crit_edge172 ]
  br i1 %21, label %.lver.check.preheader, label %.preheader

.lver.check.preheader:                            ; preds = %.preheader152
  br label %.lver.check

.lver.check:                                      ; preds = %.lver.check.preheader, %._crit_edge157.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge157.us ], [ 0, %.lver.check.preheader ]
  %indvars.iv177 = phi i64 [ %indvars.iv.next178, %._crit_edge157.us ], [ 1, %.lver.check.preheader ]
  %36 = add i64 %indvar, 1
  %37 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %37, i64 0
  %scevgep196 = getelementptr [1000 x double], [1000 x double]* %4, i64 %37, i64 %35
  %scevgep198 = getelementptr [1000 x double], [1000 x double]* %5, i64 %37, i64 0
  %scevgep200 = getelementptr [1000 x double], [1000 x double]* %5, i64 %37, i64 %35
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv177
  store double 1.000000e+00, double* %38, align 8
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv177, i64 0
  store double 0.000000e+00, double* %39, align 8
  %40 = bitcast double* %38 to i64*
  %41 = load i64, i64* %40, align 8
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv177
  %43 = bitcast [1000 x double]* %42 to i64*
  store i64 %41, i64* %43, align 8
  %44 = add nsw i64 %indvars.iv177, -1
  %indvars.iv.next178 = add nuw nsw i64 %indvars.iv177, 1
  %bound0 = icmp ult double* %scevgep, %scevgep200
  %bound1 = icmp ult double* %scevgep198, %scevgep196
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %45 = add nsw i64 %indvars.iv.lver.orig, -1
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv177, i64 %45
  %47 = load double, double* %46, align 8
  %48 = fmul double %15, %47
  %49 = fadd double %16, %48
  %50 = fdiv double %22, %49
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv177, i64 %indvars.iv.lver.orig
  store double %50, double* %51, align 8
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %44
  %53 = load double, double* %52, align 8
  %54 = fmul double %17, %53
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv177
  %56 = load double, double* %55, align 8
  %57 = fmul double %24, %56
  %58 = fsub double %57, %54
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next178
  %60 = load double, double* %59, align 8
  %61 = fmul double %17, %60
  %62 = fsub double %58, %61
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv177, i64 %45
  %64 = load double, double* %63, align 8
  %65 = fmul double %15, %64
  %66 = fsub double %62, %65
  %67 = fdiv double %66, %49
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv177, i64 %indvars.iv.lver.orig
  store double %67, double* %68, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond192.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, %35
  br i1 %exitcond192.lver.orig, label %._crit_edge.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep203 = getelementptr [1000 x double], [1000 x double]* %5, i64 %36, i64 0
  %scevgep202 = getelementptr [1000 x double], [1000 x double]* %4, i64 %36, i64 0
  %load_initial = load double, double* %scevgep202, align 8
  %load_initial204 = load double, double* %scevgep203, align 8
  br label %69

; <label>:69:                                     ; preds = %69, %.ph
  %store_forwarded205 = phi double [ %load_initial204, %.ph ], [ %87, %69 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %72, %69 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %69 ]
  %70 = fmul double %15, %store_forwarded
  %71 = fadd double %16, %70
  %72 = fdiv double %22, %71
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv177, i64 %indvars.iv
  store double %72, double* %73, align 8
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %44
  %75 = load double, double* %74, align 8
  %76 = fmul double %17, %75
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv177
  %78 = load double, double* %77, align 8
  %79 = fmul double %24, %78
  %80 = fsub double %79, %76
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next178
  %82 = load double, double* %81, align 8
  %83 = fmul double %17, %82
  %84 = fsub double %80, %83
  %85 = fmul double %15, %store_forwarded205
  %86 = fsub double %84, %85
  %87 = fdiv double %86, %71
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv177, i64 %indvars.iv
  store double %87, double* %88, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond192 = icmp eq i64 %indvars.iv.next, %35
  br i1 %exitcond192, label %._crit_edge.us.loopexit229, label %69

._crit_edge.us.loopexit:                          ; preds = %.ph.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit229:                       ; preds = %69
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit229, %._crit_edge.us.loopexit
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %25, i64 %indvars.iv177
  store double 1.000000e+00, double* %89, align 8
  br i1 %26, label %.lr.ph156.us.preheader, label %._crit_edge157.us

.lr.ph156.us.preheader:                           ; preds = %._crit_edge.us
  br label %.lr.ph156.us

.lr.ph156.us:                                     ; preds = %.lr.ph156.us.preheader, %.lr.ph156.us
  %indvars.iv175 = phi i64 [ %indvars.iv.next176, %.lr.ph156.us ], [ %34, %.lr.ph156.us.preheader ]
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv177, i64 %indvars.iv175
  %91 = load double, double* %90, align 8
  %92 = add nsw i64 %indvars.iv175, 1
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %92, i64 %indvars.iv177
  %94 = load double, double* %93, align 8
  %95 = fmul double %91, %94
  %96 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv177, i64 %indvars.iv175
  %97 = load double, double* %96, align 8
  %98 = fadd double %95, %97
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv175, i64 %indvars.iv177
  store double %98, double* %99, align 8
  %indvars.iv.next176 = add nsw i64 %indvars.iv175, -1
  %100 = icmp sgt i64 %indvars.iv175, 1
  br i1 %100, label %.lr.ph156.us, label %._crit_edge157.us.loopexit

._crit_edge157.us.loopexit:                       ; preds = %.lr.ph156.us
  br label %._crit_edge157.us

._crit_edge157.us:                                ; preds = %._crit_edge157.us.loopexit, %._crit_edge.us
  %exitcond = icmp eq i64 %indvars.iv.next178, %35
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond, label %.preheader.loopexit, label %.lver.check

.preheader.loopexit:                              ; preds = %._crit_edge157.us
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.preheader152
  br i1 %28, label %.lver.check220.preheader, label %._crit_edge172

.lver.check220.preheader:                         ; preds = %.preheader
  br label %.lver.check220

.lver.check220:                                   ; preds = %.lver.check220.preheader, %._crit_edge168.us
  %indvar206 = phi i64 [ %indvar.next207, %._crit_edge168.us ], [ 0, %.lver.check220.preheader ]
  %indvars.iv187 = phi i64 [ %indvars.iv.next188, %._crit_edge168.us ], [ 1, %.lver.check220.preheader ]
  %101 = add i64 %indvar206, 1
  %102 = add i64 %indvar206, 1
  %scevgep208 = getelementptr [1000 x double], [1000 x double]* %4, i64 %102, i64 0
  %scevgep210 = getelementptr [1000 x double], [1000 x double]* %4, i64 %102, i64 %35
  %scevgep212 = getelementptr [1000 x double], [1000 x double]* %5, i64 %102, i64 0
  %scevgep214 = getelementptr [1000 x double], [1000 x double]* %5, i64 %102, i64 %35
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv187
  %104 = getelementptr inbounds [1000 x double], [1000 x double]* %103, i64 0, i64 0
  store double 1.000000e+00, double* %104, align 8
  %105 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv187, i64 0
  store double 0.000000e+00, double* %105, align 8
  %106 = bitcast [1000 x double]* %103 to i64*
  %107 = load i64, i64* %106, align 8
  %108 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv187
  %109 = bitcast [1000 x double]* %108 to i64*
  store i64 %107, i64* %109, align 8
  %110 = add nsw i64 %indvars.iv187, -1
  %indvars.iv.next188 = add nuw nsw i64 %indvars.iv187, 1
  %bound0216 = icmp ult double* %scevgep208, %scevgep214
  %bound1217 = icmp ult double* %scevgep212, %scevgep210
  %memcheck.conflict219 = and i1 %bound0216, %bound1217
  br i1 %memcheck.conflict219, label %.ph221.lver.orig.preheader, label %.ph221

.ph221.lver.orig.preheader:                       ; preds = %.lver.check220
  br label %.ph221.lver.orig

.ph221.lver.orig:                                 ; preds = %.ph221.lver.orig.preheader, %.ph221.lver.orig
  %indvars.iv181.lver.orig = phi i64 [ %indvars.iv.next182.lver.orig, %.ph221.lver.orig ], [ 1, %.ph221.lver.orig.preheader ]
  %111 = add nsw i64 %indvars.iv181.lver.orig, -1
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv187, i64 %111
  %113 = load double, double* %112, align 8
  %114 = fmul double %17, %113
  %115 = fadd double %18, %114
  %116 = fdiv double %29, %115
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv187, i64 %indvars.iv181.lver.orig
  store double %116, double* %117, align 8
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %110, i64 %indvars.iv181.lver.orig
  %119 = load double, double* %118, align 8
  %120 = fmul double %15, %119
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv187, i64 %indvars.iv181.lver.orig
  %122 = load double, double* %121, align 8
  %123 = fmul double %31, %122
  %124 = fsub double %123, %120
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next188, i64 %indvars.iv181.lver.orig
  %126 = load double, double* %125, align 8
  %127 = fmul double %15, %126
  %128 = fsub double %124, %127
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv187, i64 %111
  %130 = load double, double* %129, align 8
  %131 = fmul double %17, %130
  %132 = fsub double %128, %131
  %133 = fdiv double %132, %115
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv187, i64 %indvars.iv181.lver.orig
  store double %133, double* %134, align 8
  %indvars.iv.next182.lver.orig = add nuw nsw i64 %indvars.iv181.lver.orig, 1
  %exitcond193.lver.orig = icmp eq i64 %indvars.iv.next182.lver.orig, %35
  br i1 %exitcond193.lver.orig, label %._crit_edge164.us.loopexit, label %.ph221.lver.orig

.ph221:                                           ; preds = %.lver.check220
  %scevgep225 = getelementptr [1000 x double], [1000 x double]* %5, i64 %101, i64 0
  %scevgep222 = getelementptr [1000 x double], [1000 x double]* %4, i64 %101, i64 0
  %load_initial223 = load double, double* %scevgep222, align 8
  %load_initial226 = load double, double* %scevgep225, align 8
  br label %135

; <label>:135:                                    ; preds = %135, %.ph221
  %store_forwarded227 = phi double [ %load_initial226, %.ph221 ], [ %153, %135 ]
  %store_forwarded224 = phi double [ %load_initial223, %.ph221 ], [ %138, %135 ]
  %indvars.iv181 = phi i64 [ 1, %.ph221 ], [ %indvars.iv.next182, %135 ]
  %136 = fmul double %17, %store_forwarded224
  %137 = fadd double %18, %136
  %138 = fdiv double %29, %137
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv187, i64 %indvars.iv181
  store double %138, double* %139, align 8
  %140 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %110, i64 %indvars.iv181
  %141 = load double, double* %140, align 8
  %142 = fmul double %15, %141
  %143 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv187, i64 %indvars.iv181
  %144 = load double, double* %143, align 8
  %145 = fmul double %31, %144
  %146 = fsub double %145, %142
  %147 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next188, i64 %indvars.iv181
  %148 = load double, double* %147, align 8
  %149 = fmul double %15, %148
  %150 = fsub double %146, %149
  %151 = fmul double %17, %store_forwarded227
  %152 = fsub double %150, %151
  %153 = fdiv double %152, %137
  %154 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv187, i64 %indvars.iv181
  store double %153, double* %154, align 8
  %indvars.iv.next182 = add nuw nsw i64 %indvars.iv181, 1
  %exitcond193 = icmp eq i64 %indvars.iv.next182, %35
  br i1 %exitcond193, label %._crit_edge164.us.loopexit228, label %135

._crit_edge164.us.loopexit:                       ; preds = %.ph221.lver.orig
  br label %._crit_edge164.us

._crit_edge164.us.loopexit228:                    ; preds = %135
  br label %._crit_edge164.us

._crit_edge164.us:                                ; preds = %._crit_edge164.us.loopexit228, %._crit_edge164.us.loopexit
  %155 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv187, i64 %32
  store double 1.000000e+00, double* %155, align 8
  br i1 %33, label %.lr.ph167.us.preheader, label %._crit_edge168.us

.lr.ph167.us.preheader:                           ; preds = %._crit_edge164.us
  br label %.lr.ph167.us

.lr.ph167.us:                                     ; preds = %.lr.ph167.us.preheader, %.lr.ph167.us
  %indvars.iv185 = phi i64 [ %indvars.iv.next186, %.lr.ph167.us ], [ %34, %.lr.ph167.us.preheader ]
  %156 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv187, i64 %indvars.iv185
  %157 = load double, double* %156, align 8
  %158 = add nsw i64 %indvars.iv185, 1
  %159 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv187, i64 %158
  %160 = load double, double* %159, align 8
  %161 = fmul double %157, %160
  %162 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv187, i64 %indvars.iv185
  %163 = load double, double* %162, align 8
  %164 = fadd double %161, %163
  %165 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv187, i64 %indvars.iv185
  store double %164, double* %165, align 8
  %indvars.iv.next186 = add nsw i64 %indvars.iv185, -1
  %166 = icmp sgt i64 %indvars.iv185, 1
  br i1 %166, label %.lr.ph167.us, label %._crit_edge168.us.loopexit

._crit_edge168.us.loopexit:                       ; preds = %.lr.ph167.us
  br label %._crit_edge168.us

._crit_edge168.us:                                ; preds = %._crit_edge168.us.loopexit, %._crit_edge164.us
  %exitcond194 = icmp eq i64 %indvars.iv.next188, %35
  %indvar.next207 = add i64 %indvar206, 1
  br i1 %exitcond194, label %._crit_edge172.loopexit, label %.lver.check220

._crit_edge172.loopexit:                          ; preds = %._crit_edge168.us
  br label %._crit_edge172

._crit_edge172:                                   ; preds = %._crit_edge172.loopexit, %.preheader
  %167 = add nuw nsw i32 %.0173, 1
  %exitcond191 = icmp eq i32 %.0173, %0
  br i1 %exitcond191, label %._crit_edge174.loopexit, label %.preheader152

._crit_edge174.loopexit:                          ; preds = %._crit_edge172
  br label %._crit_edge174

._crit_edge174:                                   ; preds = %._crit_edge174.loopexit, %6
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge15

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %9 = zext i32 %0 to i64
  %10 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv16, %8
  br label %12

; <label>:12:                                     ; preds = %19, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %19 ], [ 0, %.preheader.us ]
  %13 = add nsw i64 %indvars.iv, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %19

; <label>:19:                                     ; preds = %17, %12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next, %9
  br i1 %exitcond20, label %._crit_edge.us, label %12

._crit_edge.us:                                   ; preds = %19
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond = icmp eq i64 %indvars.iv.next17, %10
  br i1 %exitcond, label %._crit_edge15.loopexit, label %.preheader.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %2
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

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
